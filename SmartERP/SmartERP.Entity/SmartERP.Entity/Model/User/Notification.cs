using System;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class Notification : BaseEntity
    {
        public string UserCode { get; set; }
        public string RoleCode { get; set; }
        public string NotificationType { get; set; }
        public string Message { get; set; }
        public string KeyCode { get; set; }
        public string LinkCode { get; set; }
        public string ActionStatus { get; set; }
        public string PushNotificationStatus { get; set; }
        public string NotificationLink { get; set; }
        public string LinkURL { get; set; }
        public string LinkName { get; set; }
        public DateTime? PushNotificationDeliveredDate { get; set; }
    }
}
