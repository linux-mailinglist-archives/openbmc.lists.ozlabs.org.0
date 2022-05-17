Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2D529796
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 05:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2LSx4D0yz3bwZ
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 13:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O3G+JGx0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=O3G+JGx0; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2LSZ0jCcz2xD3
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 12:59:41 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id j6so32034133ejc.13
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9L5Khg1CsV1mJj4HN4+8r3xoUYvqrWbbzNA2NHh1VS8=;
 b=O3G+JGx0PAmlDvq2x9GpUet1v7PATfl8GsiiBhyyHIVm2O0mDrFI2cdDhutDtGfXT8
 s3r8VvQON0eX5Ry7QThtY5Ty/xBOnsU2CETi0HmYP75sUk5hxbhWkNKbJQPcc7asysH3
 rFyvtkqg5Cj6OOx9VMrGTPPNAaY9oJRqoFC0UVNzLO717fTxiLm5dB/MOUzkLaQA8Fva
 doT2y8b/zS8FAyyKI3zXud6q0jC7BtPL8mUe2IfZQh3H2LoFDbzi0V9t+E4ACZRSJaUi
 xJRlJYgRdYQGDP5Twb39VaBxrLp3Z9RvZKAqa0AfGcmqrRLkokLqlQF7ciRUY/KNqI7u
 zJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9L5Khg1CsV1mJj4HN4+8r3xoUYvqrWbbzNA2NHh1VS8=;
 b=7fM3aTpBAJb0TPW+kytUx8EvttFT+3OHp9r6rBxmZ1B/Y8qjbyY1P3mQAjfMT9/btW
 lOx5Yu7fbgJlN5T8XMMmSVkritdo3LZzfa5vgFW12yMfGXBliagVKcQQwNp1Mhzbhm7X
 jI/1H9hEeEGMzM47HnTg6VEGZWC0ZE3UDk+HPh8qfVYRa+MhPJ9sYacF4UyY0NNavfQn
 UDfsNXW3LfsbX9j5TYL1khEgyRn6LVAiWaJYpnbaSS/Q9kKoMabR7r7Z/PbhMq65rq90
 V88xoV695Y6ciJEmJ/sPrUHyXJKPQmYab33t4CoxJdxEdyWvSc3mTqIrANOhXehbACmX
 90yw==
X-Gm-Message-State: AOAM533a1ra0vYdBZqaQ60DBq6KeQ7ocVtpYC+QJW443UN3Y8D/WzGtZ
 45WPyfJwOwOghe9zYU7MJmD7bCnAV3xb1aGTwGM=
X-Google-Smtp-Source: ABdhPJxGJ63ltlhgS8LTmZoQvHocGvopjIvM3r608Z+Du6QZiZ0iqL/BN/4qmkWhOz/wCG85LCYzZecFk94mUosNgII=
X-Received: by 2002:a17:906:6a1b:b0:6f4:a9b8:e027 with SMTP id
 qw27-20020a1709066a1b00b006f4a9b8e027mr18063258ejc.222.1652756375444; Mon, 16
 May 2022 19:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220513033450.7038-1-kflin@nuvoton.com>
 <20220513033450.7038-6-kflin@nuvoton.com>
 <b5361f08-f9eb-9384-f904-2625bae0fd9a@molgen.mpg.de>
In-Reply-To: <b5361f08-f9eb-9384-f904-2625bae0fd9a@molgen.mpg.de>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 17 May 2022 10:59:32 +0800
Message-ID: <CADnNmFqfxDE3UbNQiyhwkLBugfZ1fSZYDbGDQFnRZdD_4q58+A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: CS20 KWLiu <kwliu@nuvoton.com>, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 mchehab@kernel.org, Marvin Lin <kflin@nuvoton.com>,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for your review and comments.

> Please mention the datasheet name and revision used to implement this?
> How can your patch be tested?
>
> For a over 2000 line patch, I would expect a longer commit message with
> a summary of the hardware features, and implementation.

Okay, I'll add more information to the commit message, but it may not
be appropriate to add the datasheet name since it is not public.
And I tested with openbmc/obmc-ikvm (with patches to support Hextile
encoding that our driver used) and used VNC Viewer to verify the video
result.

>
> As the module author should you also be added to the file `MAINTAINERS`?
> (Maybe even with a functional address <linux-npcm-video@nuvoton.com>?
>
> > Signed-off-by: Marvin Lin <kflin@nuvoton.com>
>
> Same comment as in 1/5 regarding the author email address.

I'll add a new entry in MAINTAINERS.

> > +++ b/drivers/media/platform/nuvoton/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +comment "Nuvoton media platform drivers"
> > +
> > +config VIDEO_NUVOTON
>
> Is that driver going to support all Nuvoton devices or just NPCM? If
> only NPCM, that should be part of the Kconfig config name?
>
> > +     tristate "Nuvoton NPCM Video Capture/Encode Engine driver"
> > +     depends on V4L_PLATFORM_DRIVERS
> > +     depends on VIDEO_DEV
> > +     select VIDEOBUF2_DMA_CONTIG
> > +     help
> > +       Support for the Video Capture/Differentiation Engine (VCD) and
> > +       Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
>
> Mention the module name?
>
>  > To compile this driver as a module, choose M here: the module will be
> called XXX.

The driver just supports NPCM. I'll change the config to
VIDEO_NUVOTON_NPCM_VCD_ECE.

> > +struct nuvoton_video_addr {
> > +     unsigned int size;
>
> size_t?

> > +struct rect_list_info {
> > +     struct rect_list *list;
> > +     struct rect_list *first;
> > +     struct list_head *head;
> > +     int index;
> > +     int tile_perline;
> > +     int tile_perrow;
> > +     int offset_perline;
> > +     int tile_size;
> > +     int tile_cnt;
>
> Can all of these be unsigned?

> > +     int frame_rate;
> > +     int vb_index;
>
> Unsigned?
>

They will be addressed in the next patch.

> > +     u32 bytesperline;
> > +     u8 bytesperpixel;
> > +     u32 rect_cnt;
> > +     u8 num_buffers;
> > +     struct list_head *list;
> > +     u32 *rect;
>
> I would not limit the size?

It's clearer to know that it stores u32 exactly.

> > +static u32 nuvoton_video_ece_get_ed_size(struct nuvoton_video *video,
> > +                                      u32 offset, void *addr)
>
> Use unsigned int as return value?

Okay.

> > +static void nuvoton_video_ece_enc_rect(struct nuvoton_video *video, u32 r_off_x,
> > +                                    u32 r_off_y, u32 r_w, u32 r_h)
> > +{
> > +     struct regmap *ece = video->ece.regmap;
> > +     u32 rect_offset = (r_off_y * video->bytesperline) + (r_off_x * 2);
> > +     u32 temp;
> > +     u32 w_tile;
> > +     u32 h_tile;
> > +     u32 w_size = ECE_TILE_W;
> > +     u32 h_size = ECE_TILE_H;
>
> Any reason to fix the sizes?

A "Hextile" is fixed to 16x16 pixels size, which is defined in Remote
Framebuffer Protocol (RFC 6143, chapter 7.7.4 Hextile Encoding).

> > +static void nuvoton_video_ece_ip_reset(struct nuvoton_video *video)
> > +{
> > +     reset_control_assert(video->ece.reset);
> > +     msleep(100);
> > +     reset_control_deassert(video->ece.reset);
> > +     msleep(100);
>
> 100 ms is quite long. Please add a comment, where that is documented. Is
> there a way to poll, if the device is done?

I'll add a comment. It should be reduced to ~10 us (suggested in
spec.) and there's no way to poll.

> > +
> > +static void nuvoton_video_free_diff_table(struct nuvoton_video *video)
> > +{
> > +     struct list_head *head, *pos, *nx;
> > +     struct rect_list *tmp;
> > +     int i;
>
> unsigned?
>

> > +static int nuvoton_video_find_rect(struct nuvoton_video *video,
> > +                                struct rect_list_info *info, u32 offset)
> > +{
> > +     int i = info->index;
> > +
> > +     if (offset < info->tile_perline) {
> > +             info->list = nuvoton_video_new_rect(video, offset, i);
>
> `i` is only used here, so use `info->index`?
>

> > +static int nuvoton_video_build_table(struct nuvoton_video *video,
> > +                                  struct rect_list_info *info)
> > +{
> > +     int i = info->index;
> > +     int j, ret, bit;
>
> Make `j` unsigned?
>
> > +     u32 value;
> > +     struct regmap *vcd = video->vcd_regmap;
> > +
> > +     for (j = 0; j < info->offset_perline; j += 4) {
> > +             regmap_read(vcd, VCD_DIFF_TBL + (j + i), &value);
>
> `i` is only used here, so use `info->index`?
>

> > +static void nuvoton_video_vcd_ip_reset(struct nuvoton_video *video)
> > +{
> > +     reset_control_assert(video->reset);
> > +     msleep(100);
> > +     reset_control_deassert(video->reset);
> > +     msleep(100);
>
> 100 ms is quite long. Please add a comment, where that is documented. Is
> there a way to poll, if the device is done?
>

> > +static int nuvoton_video_queue_setup(struct vb2_queue *q,
> > +                                  unsigned int *num_buffers,
> > +                                  unsigned int *num_planes,
> > +                                  unsigned int sizes[],
> > +                                  struct device *alloc_devs[])
> > +{
> > +     struct nuvoton_video *video = vb2_get_drv_priv(q);
> > +     int i;
>
> unsigned?
>

> > +static void nuvoton_video_buf_queue(struct vb2_buffer *vb)
> > +{
> > +     int empty;
> > +     struct nuvoton_video *video = vb2_get_drv_priv(vb->vb2_queue);
> > +     struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +     struct nuvoton_video_buffer *nvb = to_nuvoton_video_buffer(vbuf);
> > +     unsigned long flags;
> > +
> > +     dev_dbg(video->dev, "%s\n", __func__);
> > +
> > +     spin_lock_irqsave(&video->lock, flags);
> > +     empty = list_empty(&video->buffers);
>
> Where is empty read later?
>

> > +     regs = devm_platform_ioremap_resource_byname(pdev, VCD_MODULE_NAME);
> > +     if (IS_ERR(regs)) {
> > +             dev_err(&pdev->dev, "Failed to get VCD regmap resource!\n");
>
> Can you help the user more by saying what to fix like check devicetree
> or so?
>

Okay. All of them will be addressed in the next patch.

Regards,
Marvin
