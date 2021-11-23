Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72445A036
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 11:28:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0hy5hS4z3fs0
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 21:28:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Tue, 23 Nov 2021 21:27:09 AEDT
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz0gd4n5Pz3fpS;
 Tue, 23 Nov 2021 21:27:09 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222218953"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="222218953"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 02:24:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="571020561"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 02:23:58 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with ESMTP id 3A09A20762;
 Tue, 23 Nov 2021 12:23:56 +0200 (EET)
Date: Tue, 23 Nov 2021 12:23:56 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 05/10] media: v4l: Add definition for the Aspeed JPEG
 format
Message-ID: <YZzBPFHZ7MPwTWSm@paasikivi.fi.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-6-jammy_huang@aspeedtech.com>
 <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
 <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On Fri, Nov 19, 2021 at 10:02:40AM +0800, Jammy Huang wrote:
> Hi Sakari,
> 
> On 2021/11/18 下午 08:33, Sakari Ailus wrote:
> > Hi Jammy,
> > 
> > On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
> > > This introduces support for the Aspeed JPEG format, where the new frame
> > > can refer to previous frame to reduce the amount of compressed data. The
> > > concept is similar to I/P frame of video compression. I will compare the
> > > new frame with previous one to decide which macroblock's data is
> > > changed, and only the changed macroblocks will be compressed.
> > > 
> > > This Aspeed JPEG format is used by the video engine on Aspeed platforms,
> > > which is generally adapted for remote KVM.
> > > 
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > > ---
> > > v5:
> > >    - no update
> > > v4:
> > >    - new
> > > ---
> > >   Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
> > >   drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
> > >   include/uapi/linux/videodev2.h                   |  1 +
> > >   3 files changed, 14 insertions(+)
> > > 
> > > diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> > > index b2cd155e691b..23c05063133d 100644
> > > --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> > > +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> > > @@ -264,6 +264,18 @@ please make a proposal on the linux-media mailing list.
> > >   	of tiles, resulting in 32-aligned resolutions for the luminance plane
> > >   	and 16-aligned resolutions for the chrominance plane (with 2x2
> > >   	subsampling).
> > > +    * .. _V4L2-PIX-FMT-AJPG:
> > > +
> > > +      - ``V4L2_PIX_FMT_AJPG``
> > > +      - 'AJPG'
> > > +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
> > > +        which is generally adapted for remote KVM.
> > > +        On each frame compression, I will compare the new frame with previous
> > > +        one to decide which macroblock's data is changed, and only the changed
> > > +        macroblocks will be compressed.
> > > +
> > > +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
> > > +        for more information.
> > Is this datasheet publicly available? Do you have a URL?
> 
> Sorry, this datasheet is not publicly available.
> Hans mentioned this as well in the discussion below:
> 
> https://lkml.org/lkml/2021/11/10/101

If the vendor documentation is not publicly available, you'll need to have
the format documented here. Alternatively an open source implementation
(e.g. LGPL) is presumably fine, too.

-- 
Regards,

Sakari Ailus
