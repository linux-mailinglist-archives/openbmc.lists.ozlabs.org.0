Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DF653A90
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 03:24:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcvJk0NmCz3bZk
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 13:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KsDKiECB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KsDKiECB;
	dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcvJ630Xqz2xnK
	for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2022 13:23:48 +1100 (AEDT)
Received: by mail-vs1-xe2c.google.com with SMTP id k185so529796vsc.2
        for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2022 18:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VFTDHnDll88TPaYL7KvtdsNvFq8ZgzXZIlFN1ok/uLs=;
        b=KsDKiECBrS56TPmqiIUDPte07tYoYqXGw4oyNgupkaTeF10bKGqWZCQjJuhu4+lO38
         84vAlBc3LmdWvvnSHh0Dr7mcoTD7NWJmR4K2SeQwhaP0dUMrfe+Um/p7KYjlaH4Tn514
         u1s5HfcXBjMFbloTUXP3Xfb5V+nMkvXMBuwhrHEpbyj9Xbu1Rm6yIpuspfng+9rneHtn
         LdcReBjgck5EQDqBYw0q5WkZoeQBZN9Oi56ERWA7jqIodUjdnpucUdmtiIghlRCXlx6S
         dxaHJssKGDeqQVPdGRxiiae+Xp4gKtvS6uYCYX1dO0JctffNJDdX8WduyelfG906B9c4
         BhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFTDHnDll88TPaYL7KvtdsNvFq8ZgzXZIlFN1ok/uLs=;
        b=wVfpbAkh27fWrkjHynLpD7NtUX2O0aNVn5ZKE56KkYHjz5JEwEG0BXG+wRirHj/+Pz
         G8uOZ3AMwLZpRo6QJaboeG9PynQjK/rQtKMuHB69SfVZrXIw3lePVCo2mrk0YzDe2BO0
         18n08SJl9V92rOcdnTsNw3WyBho3IA3mpmCfOhcYS8a2p9ABXSbUroDUWnsDjBC3EGy6
         D7+n76htvvVseEat/c7jRyVMB0Y/jczGQN2vMgTHtJCs6PSQcRiarYvA32UrDklg9oYv
         +fMGpvtaz7+XdIs165VGsLryI56efZLlc5q8C6bkHj/eCn/5HlJJeT5qIT3llyigUzEU
         j6Yg==
X-Gm-Message-State: AFqh2kp85oUDFW57KIex/mpQC2SqUj5i9A4ihScf1F2b9HSyFD4RaznK
	ObDhSPO+hTzRhwwgbsxPIieGPzJCzjSdstpcmJ8=
X-Google-Smtp-Source: AMrXdXu485GKY0plvl7WKqc853dOIB+mUZa+WCeJDChwDEPLzOiTiuVy1grv9+2X/WaCczrEUdfD4Rdc6OnYT6f3IQY=
X-Received: by 2002:a05:6102:105:b0:3b1:4aad:9c47 with SMTP id
 z5-20020a056102010500b003b14aad9c47mr497116vsq.73.1671675823724; Wed, 21 Dec
 2022 18:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20221220094055.3011916-1-milkfafa@gmail.com> <20221220094055.3011916-8-milkfafa@gmail.com>
 <078aa497-e441-ef3d-c206-de23ca2658c9@collabora.com>
In-Reply-To: <078aa497-e441-ef3d-c206-de23ca2658c9@collabora.com>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 22 Dec 2022 10:23:32 +0800
Message-ID: <CADnNmFpjrRy2J5mrFnp6JRiY5W=Xot83PV_JMuBWMP-uf63Rig@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrzej,

Thanks for the review.

> > +static void npcm_video_ece_set_fb_addr(struct npcm_video *video, u32 buffer)
>
> static inline void?
>

> > +static void npcm_video_ece_set_enc_dba(struct npcm_video *video, u32 addr)
>
> ditto

> > +static void npcm_video_ece_clear_rect_offset(struct npcm_video *video)
>
> ditto

> > +static int npcm_video_ece_init(struct npcm_video *video)
>
> static inline int? But...
>
> > +{
> > +     npcm_video_ece_ip_reset(video);
> > +     npcm_video_ece_ctrl_reset(video);
> > +
> > +     return 0;
>
> ...the return value is not inspected by the only caller anyway, so why not
>
> static inline void?

OK, I'll declare these functions as static inline void.

> > +static int npcm_video_ece_stop(struct npcm_video *video)
> > +{
> > +     struct regmap *ece = video->ece.regmap;
> > +
> > +     regmap_update_bits(ece, ECE_DDA_CTRL, ECE_DDA_CTRL_ECEEN, 0);
> > +     regmap_update_bits(ece, ECE_DDA_CTRL, ECE_DDA_CTRL_INTEN, 0);
> > +     regmap_update_bits(ece, ECE_HEX_CTRL, ECE_HEX_CTRL_ENCDIS,
> > +                        ECE_HEX_CTRL_ENCDIS);
> > +     npcm_video_ece_clear_rect_offset(video);
> > +
> > +     return 0;
>
> Nobody inspects this return value. Either void, or check the return value
> at call site and handle a non-zero failure.

OK, will change to void.

> > +static unsigned int npcm_video_get_rect_count(struct npcm_video *video)
> > +{
> > +     struct list_head *head, *pos, *nx;
> > +     struct rect_list *tmp;
> > +     unsigned int count;
>
>         unsigned int count = 0;
>
> otherwise if the below condition is not met, ...
> > +
> > +     if (video->list && video->rect) {
> > +             count = video->rect[video->vb_index];
> > +             head = &video->list[video->vb_index];
> > +
> > +             list_for_each_safe(pos, nx, head) {
> > +                     tmp = list_entry(pos, struct rect_list, list);
> > +                     list_del(&tmp->list);
> > +                     kfree(tmp);
> > +             }
>
> why does a function whose name implies merely getting a number actually
> remove all elements from some list? count equals video->rect[video->vb_index];
> and everthing else looks like a(n indented?) side effect. This should be
> somehow commented in the code.
>
> > +     }
> > +
> > +     return count;
>
> ... an undefined number is returned
>
> Which makes me wonder if the compiler is not warning about using a possibly
> uninitialized value.

You are right, this is not the right place to remove the rect_list.
It makes more sense to remove the list right after the associated
video buffer gets dequeued.
I'll do that change.

> > +static int npcm_video_capres(struct npcm_video *video, u32 hor_res,
> > +                          u32 vert_res)
> > +{
> > +     struct regmap *vcd = video->vcd_regmap;
> > +     u32 res, cap_res;
> > +
> > +     if (hor_res > MAX_WIDTH || vert_res > MAX_HEIGHT)
> > +             return -EINVAL;
> > +
> > +     res = FIELD_PREP(VCD_CAP_RES_VERT_RES, vert_res) |
> > +           FIELD_PREP(VCD_CAP_RES_HOR_RES, hor_res);
> > +
> > +     regmap_write(vcd, VCD_CAP_RES, res);
> > +     regmap_read(vcd, VCD_CAP_RES, &cap_res);
> > +
> > +     if (cap_res != res)
> > +             return -EINVAL;
> > +
> > +     return 0;
>
> The return value is not handled by the caller

> > +static int npcm_video_gfx_reset(struct npcm_video *video)
> > +{
> > +     struct regmap *gcr = video->gcr_regmap;
> > +
> > +     regmap_update_bits(gcr, INTCR2, INTCR2_GIRST2, INTCR2_GIRST2);
> > +
> > +     npcm_video_vcd_state_machine_reset(video);
> > +
> > +     regmap_update_bits(gcr, INTCR2, INTCR2_GIRST2, 0);
> > +
> > +     return 0;
>
> Never inspected by callers

> > +static int npcm_video_command(struct npcm_video *video, u32 value)
> > +{
> > +     struct regmap *vcd = video->vcd_regmap;
> > +     u32 cmd;
> > +
> > +     regmap_write(vcd, VCD_STAT, VCD_STAT_CLEAR);
> > +
> > +     regmap_read(vcd, VCD_CMD, &cmd);
> > +     cmd |= FIELD_PREP(VCD_CMD_OPERATION, value);
> > +
> > +     regmap_write(vcd, VCD_CMD, cmd);
> > +     regmap_update_bits(vcd, VCD_CMD, VCD_CMD_GO, VCD_CMD_GO);
> > +     video->op_cmd = value;
> > +
> > +     return 0;
>
> Never inspected by caller

> > +static int npcm_video_start_frame(struct npcm_video *video)
> > +{
>
> One of the callers ignores the return value, but not the other. Why?

These problems will be addressed in the next patch. Thank you.

Regards,
Marvin
