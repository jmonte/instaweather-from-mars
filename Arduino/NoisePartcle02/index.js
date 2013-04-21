// forked from akm2's "Noise Particles 2 (Blur Effects)" http://jsdo.it/akm2/z7LO
/**
 * SimplexNoise class,
 * @see http://jsdo.it/akm2/2e21
 */

// Configs
var SCREEN_WIDTH = 465;
var SCREEN_HEIGHT = 465;
var PARTICLE_NUM = 300000;
var PARTICLE_VALUE_NUM = 5; // x, y, vx, vy, scale
var NOISE_WIDTH = 12;
var NOISE_HEIGHT = 12;
var COLOR1 = 'rgb(0, 195, 255)';
var COLOR2 = 'rgb(190, 255, 0)';

var canvas;
var context;
var imageData;
var particleData;
var mouseX;
var mouseY;


// Initialize

function init() {
    canvas = document.getElementById('c');
    canvas.width = SCREEN_WIDTH;
    canvas.height = SCREEN_HEIGHT;
    context = canvas.getContext('2d');
    context.fillStyle = 'rgb(0, 0, 0)';
    context.fillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    imageData = context.getImageData(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    particleData = new Float32Array(PARTICLE_NUM * PARTICLE_VALUE_NUM);
    var random = Math.random;
    for (var i = 0, len = particleData.length; i < len; i += PARTICLE_VALUE_NUM) {
        particleData[i]     = random() * SCREEN_WIDTH;  // x
        particleData[i + 1] = random() * SCREEN_HEIGHT; // y
        particleData[i + 2] = random() * 3 - 1.5; // vx
        particleData[i + 3] = random() * 3 - 1.5; // vy
        particleData[i + 4] = random() * 0.004 + 0.004; // scale
    }
    
    // ノイズフォースマップを初期化
    NoiseMap.init(SCREEN_WIDTH, SCREEN_HEIGHT, NOISE_WIDTH, NOISE_HEIGHT);
    NoiseMap.generate();
    
    // カラーマップを初期化
    ColorMap.init(SCREEN_WIDTH, SCREEN_HEIGHT, 0.25);
    ColorMap.starColor = COLOR1;
    ColorMap.endColor = COLOR2;
    ColorMap.generate();
    
    canvas.addEventListener('mousemove', function(e) {
        mouseX = e.clientX;
        mouseY = e.clientY;
    }, false);
    
    canvas.addEventListener('click', function(e) {
        NoiseMap.generate();
    }, false);
    
    FPS.init();
    
    setInterval(loop, 1000 / 60);
}


// Frame loop

function loop() {
    var data = imageData.data;
    
    for (i = 0, len = data.length; i < len; i += 4) {
        data[i]     >>= 1;
        data[i + 1] >>= 1;
        data[i + 2] >>= 1;
    }
    
    // 負荷軽減になるかもしれないのでローカル変数に代入
    var screenWidth = SCREEN_WIDTH;
    var screenHeight = SCREEN_HEIGHT;
    var particleValueNum = PARTICLE_VALUE_NUM;
    var pd = particleData;
    var nd = NoiseMap.data;
    var cd = ColorMap.data;
    
    var noff = ((mouseY >> 1) << 2) * screenWidth + ((mouseX >> 1) << 2);
    var coff = (mouseY >> 1) * screenWidth + (mouseX >> 1);
    var px, py, pscale;
    var j, k;
    var i1 /* y */, i2/* vx */, i3/* vy */;
    var c;
    
    // Update and render particles
    for (var i = 0, len = particleData.length; i < len; i += particleValueNum) {
        px = pd[i];
        py = pd[(i1 = i + 1)];
        pscale = pd[i + 4];
        
        k = ((py >> 1) << 2) * screenWidth + ((px >> 1) << 2) + noff;
        i2 = i + 2;
        i3 = i + 3;
        px += pd[i2] = pd[i2] * 0.98 + nd[k] * pscale;
        py += pd[i3] = pd[i3] * 0.98 + nd[k + 1] * pscale;
        
        if (px < 0) {
            px += screenWidth;
        } else if (px > screenWidth) {
            px -= screenWidth;
        }
        if (py < 0) {
            py += screenHeight;
        } else if (py > screenHeight) {
            py -= screenHeight;
        }
        
        k = (px >> 1) + (py >> 1) * screenWidth + coff;
        
        // カラーマップから色を取得
        c = cd[k];
        
        j = ((px | 0) + (py | 0) * screenWidth) << 2;
        data[j]     += c >> 16 & 0xFF;
        data[j + 1] += c >> 8 & 0xFF;
        data[j + 2] += c & 0xFF;
        
        pd[i]  = px;
        pd[i1] = py;
    }
    
    context.putImageData(imageData, 0, 0);
    
    FPS.countFrame();
}


// Color helpers

// @see http://wonderfl.net/c/zWmv
function cycleRGB(radian) {
    var r = (Math.cos(radian) + 1) * 0xFF >> 1;
    var g = (Math.cos(radian + Math.PI * 0.5) + 1) * 0xFF >> 1;
    var b = (Math.cos(radian + Math.PI) + 1) * 0xFF >> 1;
    return 'rgb(' + r + ', ' + g + ', ' + b + ')';
}


/**
 * NoiseMap
 */
var NoiseMap = {
    _noise: null,
    _noiseCtx: null,
    _map: null,
    _mapCtx: null,
    _xGen: new Akm2.SimplexNoise(),
    _yGen: new Akm2.SimplexNoise(),
    
    data: null, // Pixel data
    
    init: function(width, height, noiseWidth, noiseHeight) {
        this._map = document.createElement('canvas');
        this._map.width = width;
        this._map.height = height;
        this._mapCtx = this._map.getContext('2d');
        if (this._mapCtx.hasOwnProperty('mozImageSmoothingEnabled')) {
            this._mapCtx.mozImageSmoothingEnabled = true;
        }
        
        this._noise = document.createElement('canvas');
        this._noise.width = noiseWidth;
        this._noise.height = noiseHeight;
        this._noiseCtx = this._noise.getContext('2d');
        
        this.data = new Int8Array(width * height * 4);
    },
    
    generate: function() {
        var nw = this._noise.width, nh = this._noise.height;
		var nctx = this._noiseCtx;
        var nimgd = nctx.getImageData(0, 0, nw, nh);
        var ndata = nimgd.data;
        
        var xGen = this._xGen, yGen = this._yGen;
        
        var time = new Date().getTime();
        xGen.seed(time);
        yGen.seed(Math.floor(Math.random() * time));
        
        for(var y = 0, x, j; y < nh; y++) {
            for(x = 0; x < nw; x++) {
                j = (x + y * nw) * 4;
                ndata[j]     = xGen.noise(x, y) * 255;
                ndata[j + 1] = yGen.noise(x, y) * 255;
                ndata[j + 3] = 255;
            }
        }
        
        nctx.putImageData(nimgd, 0, 0);
        
		var mw = this._map.width, mh = this._map.height;
		var mctx = this._mapCtx;
        mctx.drawImage(this._noise, 0, 0, mw, mh);
        
        var mdata = mctx.getImageData(0, 0, mw, mh).data;
        var data = this.data;
        for (var i = 0, len = data.length; i < len; i += 4) {
            data[i]     = mdata[i] - 127;
            data[i + 1] = mdata[i + 1] - 127;
        }
        
        return data;
    }
};


/**
 * ColorMap
 */
var ColorMap = {
    _map: null,
    _ctx: null,
    _t: 1,
    
    data: null, // Pixel data
    thickness: 1,
    starColor: '',
    endColor: '',
    
    init: function(width, height, thickness) {
        this._map = document.createElement('canvas');
        this._map.width = width;
        this._map.height = height;
        this._ctx = this._map.getContext('2d');
        
        if (Akm2.isNumeric(thickness)) this.thickness = thickness;
        
        this.data = new Int32Array(width * height);
    },
    
    generate: function() {
        var w = this._map.width, h = this._map.height;
		var ctx = this._ctx;
		var grad = ctx.createLinearGradient(0, 0, w, h);
		grad.addColorStop(0, this.starColor);
        grad.addColorStop(1, this.endColor);
        ctx.fillStyle = grad;
        ctx.rect(0, 0, w, h);
        ctx.fill();
        
        var mapData = ctx.getImageData(0, 0, w, h).data;
        var data = this.data;
        var t = this.thickness;
        for (var i = 0, len = data.length; i < len; i++) {
            j = i * 4;
            data[i] = 255 << 24 | ((mapData[j] * t) | 0) << 16 | ((mapData[j + 1] * t) | 0) << 8 | ((mapData[j + 2] * t) | 0);
        }
    }
};


/**
 * FPS
 */
var FPS = {
    _count: 0,
    _last: 0,
    _view: 0,
    
    init: function() {
        this.last = new Date().getTime();
        
        var view = document.createElement('div');
        view.id = 'fps';
        view.style.color = 'rgb(255, 255, 255)';
        view.style.fontSize = '10px';
        view.style.position = 'absolute';
        view.style.top = '5px';
        view.style.left = '5px';
        view.innerHTML = 'FPS';
        document.body.appendChild(view);
        this._view = view;
    },
    
    countFrame: function() {
        this._count++;
        if (this._count == 60) {
            var now = new Date().getTime();
            this._view.innerHTML = 'FPS ' + (1000 / ((now - this._last) / this._count)).toFixed(2);
            this._count = 0;
            this._last = now;
        }
    }
};

// Init
window.addEventListener('load', init, false);
