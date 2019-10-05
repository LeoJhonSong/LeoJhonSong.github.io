function set_image_size(image, width, height) {
    // image.setAttribute("style", "height: " + height + "%");
    image.setAttribute("style", "width: " + width + "%");
}

function hexo_resize_image() {
    var imgs = document.getElementsByTagName('img');
    for (var i = imgs.length - 1; i >= 0; i--) {
        var img = imgs[i];

        var src = img.getAttribute('src').toString();

        var fields = src.match(/(?<=\?)\d*x\d*/g);
        // if (fields && fields.length == 1) {
        //     var values = fields[0].split("x");
        //     if (values.length == 2) {
        //         var width = values[0];
        //         var height = values[1];

        //         if (!(width.length && height.length)) {
        //             var n_width = img.naturalWidth;
        //             var n_height = img.naturalHeight;
        //             if (width.length > 0) {
        //                 height = n_height * width / n_width;
        //             }
        //             if (height.length > 0) {
        //                 width = n_width * height / n_height;
        //             }
        //         }
        //         set_image_size(img, width, height);
        //     }
        //     continue;
        // }

        fields = src.match(/(?<=\?)\d*/g);
        if (fields && fields.length == 1) {
            var scale = parseFloat(fields[0].toString());
            // var width = scale / 100.0 * img.naturalWidth;
            // var height = scale / 100.0 * img.naturalHeight;
            var width = scale;
            var height = scale;
            set_image_size(img, width, height);
        }
    }
}

// 整个页面都加载出来之后再设置图片大小
document.onload = hexo_resize_image();