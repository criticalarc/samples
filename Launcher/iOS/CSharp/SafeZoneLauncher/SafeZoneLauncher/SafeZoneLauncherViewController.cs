using System;
using System.Drawing;

using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace SafeZoneLauncher
{
	public partial class SafeZoneLauncherViewController : UIViewController
	{
		public SafeZoneLauncherViewController (IntPtr handle) : base (handle)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		#region View lifecycle

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
			// Perform any additional setup after loading the view, typically from a nib.
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
		}

		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
		}

		public override void ViewDidDisappear (bool animated)
		{
			base.ViewDidDisappear (animated);
		}

		#endregion

		partial void OnLaunchButtonTouchUpInside (NSObject sender)
		{
			NSUrl launchUrl = NSUrl.FromString("com.criticalarc.safezoneapp://launch");
			string storeUrlFormat = "http://itunes.apple.com/{0}/app/id533054756";

			if (UIApplication.SharedApplication.CanOpenUrl(launchUrl))
				UIApplication.SharedApplication.OpenUrl(launchUrl);
			else
			{
				string storeUrlString = string.Format(storeUrlFormat, NSLocale.CurrentLocale.CountryCode);
				NSUrl storeUrl = NSUrl.FromString(storeUrlString);
				UIApplication.SharedApplication.OpenUrl(storeUrl);
			}
		}
	}
}

