Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C97B6E36
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0NKF1kx9z3cBC
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 03:18:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0NJv4VQfz2yW7;
	Wed,  4 Oct 2023 03:17:49 +1100 (AEDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0NGw0PMnz6K5tf;
	Wed,  4 Oct 2023 00:16:08 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 3 Oct
 2023 17:17:43 +0100
Date: Tue, 3 Oct 2023 17:17:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <20231003171742.00004a14@Huawei.com>
In-Reply-To: <CACSj6VUS+cjsvjzY=wggMXXO1DEH0=9aHi1ADp0F-O8AKL5cCg@mail.gmail.com>
References: <20230928123009.2913-1-aladyshev22@gmail.com>
	<20230928123009.2913-4-aladyshev22@gmail.com>
	<20230929120835.0000108e@Huawei.com>
	<CACSj6VUS+cjsvjzY=wggMXXO1DEH0=9aHi1ADp0F-O8AKL5cCg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2 Oct 2023 17:41:42 +0300
Konstantin Aladyshev <aladyshev22@gmail.com> wrote:

> Thanks for the review!
> I've corrected many things from your comments and have sent the V2 patch.
> I'm not sure about the LIST thing and all the devres management. I've
> written the KCS handling the same way it is done in the standard IPMI
> KCS driver (https://github.com/torvalds/linux/blob/master/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c)
> Not sure if we need to do any different here.
> Please see detailed response below:
> 
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>  
> > Check these.  There aren't any mutex's in here that I noticed...
> >  
> 
> Currently there are no mutex's in the driver. Where do you think they
> are needed?
> For example there no mutex's in the 'mctp-serial.c' driver
> (https://github.com/torvalds/linux/blob/master/drivers/net/mctp/mctp-serial.c)

I don't think you need a mutex.  Hence don't include the header either! :)
> 
> > > +#include <linux/netdevice.h>

...

> > > +
> > > +static DEFINE_SPINLOCK(kcs_bmc_mctp_instances_lock);
> > > +static LIST_HEAD(kcs_bmc_mctp_instances);  
> > As mentioned below, this seems to be only used to find some data again
> > in remove. Lots of cleaner ways to do that than a list in the driver.
> > I'd explore the alternatives.
> >  
> 
> This was copied from the other KCS drivers. For example please see
> 'kcs_bmc_cdev_ipmi.c':
> https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L469

Sure, I spotted it was copied but doesn't mean I like that code either :)


> 
> > > +
> > > +static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc)
> > > +{
> > > +     struct mctp_kcs *mkcs;
> > > +     struct net_device *ndev;
> > > +     char name[32];
> > > +     int rc;
> > > +
> > > +     snprintf(name, sizeof(name), "mctpkcs%d", kcs_bmc->channel);
> > > +
> > > +     ndev = alloc_netdev(sizeof(*mkcs), name, NET_NAME_ENUM, mctp_kcs_setup);  
> > Interesting that there is an explicit devm_register_netdev() but not one for
> > this simple allocation case (there is one for the ethernet specific version).
> > Never mind, we have devm_add_action_or_reset() for that.  Just create a
> > small wrapper for free_netdev() (which will look like devm_free_netdev()
> > in net/devres.c but that's local to that file) and add
> >
> >         rc = devm_add_action_or_reset(&kcs_bmc->dev,
> >                                       wrapper_for_free_netdev(), ndev);
> >         if (rc)
> >                 return rc;
> >  
> 
> 
> Did you mean something like this?
> ```
> static void devm_free_netdev(struct device *dev, void *this)
> {
> struct net_device_devres *res = this;
> 
> free_netdev(res->ndev);
> }

No. That would be unwind for a devm_alloc_netdev() which doesn't
exist for the case where you want to override the manual version.

Here would be
static void kcs_bmc_mctp_free_netdev(void *priv)
{
	free_netdev(priv);
}


> 
> 
> ...
> 
> static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc)
> {
> 
> // Instead of:
> //ndev = alloc_netdev
> //rc = register_netdev(ndev);
> 
> // Use
> ...
> if (!devm_register_netdev(kcs_bmc->dev, ndev)) {
> dev_err_probe(kcs_bmc->dev,
>         "alloc_netdev failed for KCS channel %d\n",
>         kcs_bmc->channel);
> return -ENOMEM;
> }
> 
> rc = devm_add_action_or_reset(&kcs_bmc->dev,
>                               devm_free_netdev(),
>                               ndev);
> if (rc)
> return rc;
> ...
> }
> ```
> What calls do I need to perform in `kcs_bmc_mctp_remove_device` in this case?
> Do I still have to perform `unregister_netdev` and `free_netdev` for example?

Ideally none at all once everthing has moved over to device managed (devm) based
handling.  The purpose of devm is to automatically call all the release functions
in reverse order of the setup calls (gets more complex but in this case it will
simply be reverse order).  That will occur on an error in probe() or after
remove() callback is called. Happens without the remove() callback as well which
is what we want here.
> 
> Anyway I don't see anything similar in the current mctp-i2c/mctp-serial drivers.

True - lots of examples elsewhere though :)

> 
> 
> > > +     if (!ndev) {
> > > +             dev_err(kcs_bmc->dev,
> > > +                     "alloc_netdev failed for KCS channel %d\n",
> > > +                     kcs_bmc->channel);  
> > No idea if the kcs subsystem handles deferred probing right, but in general
> > anything called just in 'probe' routines can use dev_err_probe() to pretty
> > print errors and also register any deferred cases with the logging stuff that
> > lets you find out why they were deferred.
> >  
> 
> Done
> 
> > > +             rc = -ENOMEM;
> > > +             goto err;  
> > In general I find it easier to follow code that only uses a goto if there
> > is shared cleanup to do.
> >                 return -ENOMEM; and for this path I don't need to read further.  
> 
> Done
> 
> > > +     }
> > > +
> > > +     mkcs = netdev_priv(ndev);
> > > +     mkcs->netdev = ndev;
> > > +     mkcs->client.dev = kcs_bmc;
> > > +     mkcs->client.ops = &kcs_bmc_mctp_client_ops;
> > > +     mkcs->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> > > +     mkcs->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);  
> >
> > You should not be mixing device manged cleanup and manual cleanup.  Rule of thumb
> > is don't call any devm_ functions in a 'probe / add' type routine after you pass
> > the first element that requires manual cleanup. Otherwise you get horrible
> > race conditions or if not that, just code that is hard to check for them.
> >  
> 
> Not sure how to fix

Some simple rules of thumb.

1. The first call in probe() that you make that does not have automated cleanup
   (so non devm_ * or you haven't manually added a cleanup callback via
    devm_add_action_or_reset()) ends devm usage in probe.
2. In remove() and in error paths in probe() don't do anything at all to cleanup
   stuff that was registered with devm_ calls as they will be automatically
   cleaned up for you.

In a simple driver it's often possible to move everything over to devm_ 
calls so there is no manual cleanup to do at all. If that's the case
don't provide a remove() callback.  However the subsystem may insist
on one in which case either fix that (they should be optional) or
provide an empty one.



> > > +
> > > +static int kcs_bmc_mctp_remove_device(struct kcs_bmc_device *kcs_bmc)
> > > +{
> > > +     struct mctp_kcs *mkcs = NULL, *pos;
> > > +
> > > +     dev_info(kcs_bmc->dev, "Remove MCTP client for the KCS channel %d",
> > > +              kcs_bmc->channel);
> > > +     spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> > > +     list_for_each_entry(pos, &kcs_bmc_mctp_instances, entry) {
> > > +             if (pos->client.dev == kcs_bmc) {
> > > +                     mkcs = pos;
> > > +                     list_del(&pos->entry);
> > > +                     break;  
> > I don't know the kcs stuff at all but these seems 'unusual'.
> > Can't you stash  device_set_drvdata(kcs_bmc->dev) or does it
> > just match the structure containing the client pointed to
> > by kcs_bmc_device? If so use something like
> > container_of(kcs_bmc->client, struct mctp_kcs, client);
> > Ah. You already have a function for that.  Why not use that here?
> >
> > There isn't normally a reason for a driver to maintain an
> > additional list like this.
> >  
> 
> Once again this logic was copied from the KCS IPMI driver:
> https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L520

Understood - should be able to do better than that though ;)

> 
> > > +             }
> > > +     }
> > > +     spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> > > +
> > > +     if (!mkcs)
> > > +             return -ENODEV;
> > > +
> > > +     unregister_netdev(mkcs->netdev);
> > > +     free_netdev(mkcs->netdev);  
> >
> > This stuff should be opposite order of add above, or leave it to devm to clean up.  
> 
> Which things are exact things that are currently in the incorrect order?

Allocations occur in probe just before register_netdev, so they should be
before free_netdev() for example.

> 
> >  
> > > +     kcs_bmc_disable_device(mkcs->client.dev, &mkcs->client);  
> >
> > This doesn't match with stuff in add - so I'd like a comment to explain
> > why it is here.  Also needs a comment on the ordering.  Perhaps this
> > is why you can't use devm for all the above, in which case I'd use it
> > nowhere in this driver.
> > I'm also confused on relationship between mks->client.dev and kcs_bmc
> > (I'm fairly sure they are the same, so just use kcs_bmc here).
> >  
> 
> I've changed the variable. Not sure about `kcs_bmc_disable_device`.
> I've added it since it is also present in the IPMI KCS driver.
> https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L533

Understood. Would need some experimenting to figure
out a path where it does something rather than it already
being disabled.

> 
> >  
> > > +     devm_kfree(kcs_bmc->dev, mkcs->data_in);
> > > +     devm_kfree(kcs_bmc->dev, mkcs->data_out);  
> >
> > Alarm bells occur whenever an explicit devm_kfree turns up in
> > except in complex corner cases. Please look at how devm based
> > resource management works. These should not be here.
> >
> > Also, remove_device should either do things in the opposite order
> > to add_device, or it should have comments saying why not!
> >
> >  
> 
> https://github.com/torvalds/linux/blob/8a749fd1a8720d4619c91c8b6e7528c0a355c0aa/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c#L534C2-L534C2

Yeah. That's bad :(  Seems devm being relied on for error paths, but not
remove() 


> 
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct kcs_bmc_driver_ops kcs_bmc_mctp_driver_ops = {
> > > +     .add_device = kcs_bmc_mctp_add_device,
> > > +     .remove_device = kcs_bmc_mctp_remove_device,
> > > +};
> > > +
> > > +static struct kcs_bmc_driver kcs_bmc_mctp_driver = {
> > > +     .ops = &kcs_bmc_mctp_driver_ops,
> > > +};
> > > +
> > > +static int __init mctp_kcs_init(void)
> > > +{
> > > +     kcs_bmc_register_driver(&kcs_bmc_mctp_driver);
> > > +     return 0;
> > > +}
> > > +
> > > +static void __exit mctp_kcs_exit(void)
> > > +{
> > > +     kcs_bmc_unregister_driver(&kcs_bmc_mctp_driver);
> > > +}  
> >
> > Hmm. So kcs is a very small subsystem hence no one has done the usual
> > module_kcs_driver() wrapper (see something like module_i2c_driver)
> > for an example.  You can just use the underlying macro directly
> > though to get rid of most of this boilerplate.
> >
> >
> > module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
> >               kcs_bmc_uregister_driver);
> >  
> 
> Not possible. If I understand error message correctly it is from the
> fact that 'kcs_bmc_register_driver' returns void:

That's annoying..  Could fix it by making it return an int so it
could report the failure it handles to the caller module instead
of always returning success...  That smells like a bug to me though
I haven't checked if the module_init() return value gets used
for anything much.


> ```
> | drivers/net/mctp/mctp-kcs.c: In function 'kcs_bmc_mctp_driver_init':
> | drivers/net/mctp/mctp-kcs.c:576:36: error: void value not ignored as
> it ought to be
> |   576 | module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
> kcs_bmc_unregister_driver);
> | include/linux/device/driver.h:265:16: note: in definition of macro
> 'module_driver'
> |   265 |         return __register(&(__driver) , ##__VA_ARGS__); \
> |       |                ^~~~~~~~~~
> | include/linux/device/driver.h:266:1: error: control reaches end of
> non-void function [-Werror=return-type]
> |   266 | } \
> |       | ^
> | drivers/net/mctp/mctp-kcs.c:576:1: note: in expansion of macro 'module_driver'
> |   576 | module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
> kcs_bmc_unregister_driver);
> |       | ^~~~~~~~~~~~~
> | cc1: some warnings being treated as errors
> ```
> 
> > > +
> > > +module_init(mctp_kcs_init);
> > > +module_exit(mctp_kcs_exit);
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Konstantin Aladyshev <aladyshev22@gmail.com>");
> > > +MODULE_DESCRIPTION("MCTP KCS transport");  
> >  
> 
> Best regards,
> Konstantin Aladyshev
> 

