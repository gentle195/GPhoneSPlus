let scanner = new Instascan.Scanner({
    video: document.getElementById('video'),
    facingMode: 'environment'
});

Instascan.Camera.getCameras().then(function (cameras) {
    if (cameras.length > 0) {
        scanner.start(cameras[0]);
    } else {
        alert('Cameras found');
    }
}).catch(function (e) {
    console.error(e);
});

scanner.addListener('scan', function (barcode) {
    document.getElementById('idSanPham').value = barcode;

    fetch(`/ban-hang/them-gio-hang?${barcode}`)
        .then((data) => {
            console.log(data); // Hiển thị thông báo từ server
        })
        .catch((error) => {
            console.error(error);
        });

    // Chuyển người dùng đến trang controller khi quét thành công
    window.location.href =  `/ban-hang/them-gio-hang/${barcode}`;
});



