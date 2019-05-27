Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8872B58D
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 14:41:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CGn70b8LzDqL2
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 22:41:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="AHP2HEik"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CGm75r8rzDqFS
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 22:40:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 82279411FA;
 Mon, 27 May 2019 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1558960834; x=1560775235; bh=mlEuxme9FOKhV+NhjQaTTeVE/y+YVG3pQk1
 Ni7wwkbs=; b=AHP2HEikXbCGBsVijDQVFCvPF59E63hBsHo/slaswzjQdGTjCGg
 4S/4c9vnKkq2Vy0R431H4pTc/IqI/kqhZbeepTWz9a0I7z1mFIVjz/1VsNy1cA11
 PPr/ff2DoXNkO+a27WQhkfVw9Ul2wg2nYeDF2CCslEJmW/siKRJ8TKPA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvkiFtmontqg; Mon, 27 May 2019 15:40:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AE79E41206;
 Mon, 27 May 2019 15:40:34 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 27
 May 2019 15:40:34 +0300
Date: Mon, 27 May 2019 15:40:34 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: IKVM on AST2400
Message-ID: <20190527124034.GA3213@bbwork.lan>
References: <d826c4212f9b472ab33bf1036e5a4768@Eltsrv03.Eltan.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d826c4212f9b472ab33bf1036e5a4768@Eltsrv03.Eltan.local>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, May 27, 2019 at 08:19:44AM +0000, Wim Vervoorn wrote:
> Hello Alexander,
> 
> We are supporting the AST2400 as well.
> 
> I am also wondering what the correct changes are to get iKVM working properly on the AST2400.
> 
> The errors caused by create_usbhid.sh are caused by usb gadget support that isn't enabled. This should be done in the Linux kernel. We are using the following options:
> 
> CONFIG_USB_GADGET=y
> CONFIG_USB_F_HID=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_ASPEED_VHUB=y
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_CONFIGFS_MASS_STORAGE=y
> CONFIG_USB_CONFIGFS_F_HID=y
> 
> The CONFIG_USB_CONFIGFS_MASS_STORAGE is not really needed for this. This is only required if you also want to support emulation of a USB storage device.
> 
> Besides this you need a small change to the aspeed-g4.dtsi and the system dts to add the VHUB device. You can copy that from the aspeed-g5.dtsi.

Yes, I've done it too. 

> 
> I am wondering which support you enabled for the actual iKVM support to work and which code you are actually using. (which kernel etc).

We use linux-aspeed recipe from OpenBMC mainline.
So, our kernel is 5.1.3.

I've also enabled these options:
    CONFIG_DRM=y
    CONFIG_DRM_ASPEED_GFX=y
    CONFIG_FRAME_VECTOR=y
    CONFIG_MEDIA_SUPPORT=y
    CONFIG_MEDIA_CAMERA_SUPPORT=y
    CONFIG_VIDEO_DEV=y
    CONFIG_VIDEO_V4L2=y
    CONFIG_V4L_PLATFORM_DRIVERS=y
    CONFIG_VIDEO_ASPEED=y
    CONFIG_VIDEOBUF2_CORE=y
    CONFIG_VIDEOBUF2_V4L2=y
    CONFIG_VIDEOBUF2_MEMOPS=y
    CONFIG_VIDEOBUF2_DMA_CONTIG=y
    CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

and copied vga_scratch and video nodes from aspeed-g5.dtsi.
I've sent these changes to correspond maillists.
  https://lore.kernel.org/patchwork/patch/1079462/

> 
> As far as I have understood these memory area's are required but I am not really sure about it.
> 
> 		gfx_memory: framebuffer {
> 			size = <0x00800000>;
> 			alignment = <0x01000000>;
> 			compatible = "shared-dma-pool";
> 			reusable;
> 		};
> 
> 		video_engine_memory: jpegbuffer {
> 			size = <0x02000000>;	/* 32MM */
> 			alignment = <0x01000000>;
> 			compatible = "shared-dma-pool";
> 			reusable;
> 		};
> 
> The questions I have are :  
> 
> The "gfx_memory" area seems double to me we also have the "vga_memory" area which also is the video memory, why do we need to define a 2nd one that as far as I understand it points to the same physical part of RAM. 
> 

If I understand right, this node is not required for AST2400 because GFX is 
unsupported by SoC.

> I can understand where the "video_engine_memory" is for but it is not clear how I can determine the required size. As the total amount of memory is limited we are trying to reduce memory usage where possible and so far I haven't been able to find out what is defining the size of this block of memory.

I can't say anything about choosing buffer's size. I just copied it from AST2500 
and it works for me.

> 
> Best regards,
> 
> Wim Vervoorn 
> 
> 
> 
> 
> 
> 
> Date: Fri, 24 May 2019 15:03:28 +0300
> From: "Alexander A. Filippov" <a.filippov@yadro.com>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: IKVM on AST2400
> Message-ID: <20190524120328.GA648@bbwork.lan>
> Content-Type: text/plain; charset="utf-8"
> 
> Some time ago the obmc-ikvm service was added to the firmware. It causes some problems on our VESNIN hardware. As it based on AST2400 it does not have support for IKVM in the DTS. The system log contains messages that create_usbhid.sh is unable to find some items in the sysfs and then obmc-ikvm service crashes. It causes fail in QEMU_CI test.
> 
> I belive that this issue also present on other platforms based on AST2400. 
> 
> IBM Guys: Do you run tests for Palmetto? 
> Is there anybody else who uses AST2400?
> 
> Well, my proposal is to make the IKVM support optional by moving it to the distrofeature.
> 
> Besides, I've solved these problems for our hardware by adding required kernel modules and modifying DTS. 
> IKVM works, but bring a lot of warnings after the host was shut down while the VNC-client is still connected.
> 
> During the solving I copied some records from aspeed-g5.dtsi to aspeed-g4.dtsi. 
> Should I commit these changes to Torvalds or OpenBMC repo?
> 
> --
> Regards
> Alexander Filippov
> Software Engineer, YADRO
> 
> 
> 
