using DevExpress.Web;
using DevExpress.XtraScheduler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserType"] == null)
            //    Response.Redirect("~/Default.aspx");
            //if (Session["UserType"].ToString().ToLower() != "admin")
            //    Response.Redirect("~/Default.aspx");

            ASPxScheduler1.Start = DateTime.Today.AddMonths(-1);
            ASPxScheduler1.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;

            //Prevent Dragging an Appointment if not an Admin
            ASPxScheduler1.OptionsCustomization.AllowAppointmentDrag =  UsedAppointmentType.Custom;
            ASPxScheduler1.AllowAppointmentDrag += ASPxScheduler1_AllowAppointmentDrag;
            //Prevent Editing an Appointment if not an Admin
            ASPxScheduler1.OptionsCustomization.AllowAppointmentResize = UsedAppointmentType.Custom;
            ASPxScheduler1.AllowAppointmentResize += ASPxScheduler1_AllowAppointmentDrag;
            //Prevent Deleting an Appointment if not an Admin
            ASPxScheduler1.OptionsCustomization.AllowAppointmentDelete = UsedAppointmentType.Custom;
            ASPxScheduler1.AllowAppointmentDelete += ASPxScheduler1_AllowAppointmentDrag;
            //Prevent Creating an Appointment if not an Admin
            ASPxScheduler1.OptionsCustomization.AllowAppointmentCreate = UsedAppointmentType.Custom;
            ASPxScheduler1.AllowAppointmentCreate += ASPxScheduler1_AllowAppointmentDrag;
        }

        private void ASPxScheduler1_AllowAppointmentDrag(object sender, DevExpress.XtraScheduler.AppointmentOperationEventArgs e)
        { 
            if (Session["UserType"] == null)
                e.Allow = false;
            else if(Session["UserType"].ToString().ToLower() != "admin")
                e.Allow = false;
        }
    }
}