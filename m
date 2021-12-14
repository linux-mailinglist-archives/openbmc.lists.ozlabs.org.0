Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0842474B66
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 20:00:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD74b4HFsz3c63
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 06:00:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD74L36yKz2yJM;
 Wed, 15 Dec 2021 06:00:33 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239279214"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="239279214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 10:32:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="661540417"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 10:32:18 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id C7C0B20462;
 Tue, 14 Dec 2021 20:32:16 +0200 (EET)
Date: Tue, 14 Dec 2021 20:32:16 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: aspeed: move err-handling together to the bottom
Message-ID: <YbjjMDQ+V6ilbQvj@paasikivi.fi.intel.com>
References: <20211206004811.1118-1-jammy_huang@aspeedtech.com>
 <20211214155300.0132946e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214155300.0132946e@coco.lan>
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
Cc: Jammy Huang <jammy_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mauro,

On Tue, Dec 14, 2021 at 03:53:00PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 6 Dec 2021 08:48:11 +0800
> Jammy Huang <jammy_huang@aspeedtech.com> escreveu:
> 
> > refine aspeed_video_setup_video() flow.
> 
> Why? It makes no difference where the error handling code is. Let's
> keep it as preferred by the driver's author ;-)

Doing error handling can be done in different ways of course, but I think
it's easier to see it's right as it's done by this patch. Of course the
original author's --- like anyone else's --- review wouldn't hurt. But I
see he hasn't reviewed other recent patches to the driver either.

A better description would be nice though, including capital letter
beginning a sentence.

> 
> Regards,
> Mauro
> 
> > 
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> > v2:
> >  - remove change-id in comment
> > ---
> >  drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
> >  1 file changed, 11 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index fea5e4d0927e..f5c40d6b4ece 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
> >  
> >  	rc = video->ctrl_handler.error;
> >  	if (rc) {
> > -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> > -		v4l2_device_unregister(v4l2_dev);
> > -
> >  		dev_err(video->dev, "Failed to init controls: %d\n", rc);
> > -		return rc;
> > +		goto err_ctrl_init;
> >  	}
> >  
> >  	v4l2_dev->ctrl_handler = &video->ctrl_handler;
> > @@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
> >  
> >  	rc = vb2_queue_init(vbq);
> >  	if (rc) {
> > -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> > -		v4l2_device_unregister(v4l2_dev);
> > -
> >  		dev_err(video->dev, "Failed to init vb2 queue\n");
> > -		return rc;
> > +		goto err_vb2_init;
> >  	}
> >  
> >  	vdev->queue = vbq;
> > @@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
> >  	video_set_drvdata(vdev, video);
> >  	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
> >  	if (rc) {
> > -		vb2_queue_release(vbq);
> > -		v4l2_ctrl_handler_free(&video->ctrl_handler);
> > -		v4l2_device_unregister(v4l2_dev);
> > -
> >  		dev_err(video->dev, "Failed to register video device\n");
> > -		return rc;
> > +		goto err_video_reg;
> >  	}
> >  
> >  	return 0;
> > +
> > +err_video_reg:
> > +	vb2_queue_release(vbq);
> > +err_vb2_init:
> > +err_ctrl_init:
> > +	v4l2_ctrl_handler_free(&video->ctrl_handler);
> > +	v4l2_device_unregister(v4l2_dev);
> > +	return rc;
> >  }
> >  
> >  static int aspeed_video_init(struct aspeed_video *video)
> 
> 
> 
> Thanks,
> Mauro

-- 
Sakari Ailus
