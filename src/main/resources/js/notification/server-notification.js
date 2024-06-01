var toastr = window.toastr;
let notification = [[${notification}]];
let notificationType = [[${notificationType}]];
switch (notificationType) {
    case 'success':
        toastr.success(notification);
        break;
    case 'error':
        toastr.error(notification);
        break;
    case 'info':
        toastr.info(notification);
        break;
    case 'warning':
        toastr.warning(notification);
        break;
    default:
        toastr.info(notification);
        break;
}