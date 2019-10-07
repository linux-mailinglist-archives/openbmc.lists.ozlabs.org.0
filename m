Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22854CE735
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 17:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n3zg5c5MzDqF1
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 02:19:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p+PbBqYF"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n3yy5vttzDqDT
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 02:18:32 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id e11so11291528otl.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9sMzdxKR5bsNDgRlEm4FiFwTHECxi6sFPzgdlxCKip4=;
 b=p+PbBqYF9CwsjCgmMnz/f1y4gTLHIVvndHaA1Q24xtauyk/MfMYF5dRz57shtXvQkK
 bbA6aQn6pXlss5Cx235XeFFZezyJU4H9lMY8QRp9ge7BxI9NsrUiDR+CLIMKes2Hhb4F
 5QtsPWcTobkKrCbprGLvBZnT7Xmq/xyL2OPgx3gF+ZXfkNiMbptXOOueewzzgbQYESY0
 Ae7QHaTxixAGnPjsMgFD52XZ/9/H7+ffzFuTFoWVICxUKKiWL6C4XHWA8uLOEMBXIkiK
 hvpUOXnuUxcIXwwMjW71rPUjkPu2M6Fok8dbLfVEOPZ7V95iqAU+nLluh3R16U2vL3N5
 ZZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9sMzdxKR5bsNDgRlEm4FiFwTHECxi6sFPzgdlxCKip4=;
 b=rOTvyfyYnSmdQH5ArR2WzoN1K7D0Yca12qOjlPvrcNV9gVgaZTOmBMvqQ58EdLWlca
 5HdCWd5HEdkGFMlLX0fOnT/rjOeOJELsJH1DQR+393Ghvi0JnOpwX0cYOO0Bu/A+h+I6
 3s40+rOBrgiuptJQlaIhQjUrU2RdXFY+D4HHyPxre9+mTkEy1QvMmtk57WhlU230sUmq
 iWY2XlLEPkkaqU6p6AN3sbShp9ilTpnv+9Diwd33EVqaqVssfO/OzRMPJiJ7ko+JAg/b
 s2IDpXjGB7o6BXonScu2VYlCzMTU0OsJI/lmaY+rYysF+Qh74JEETwVW9ya+gq6Bfz0t
 se+Q==
X-Gm-Message-State: APjAAAXxoYeN+6kDLPTpI/F5h9cN0O5lmQNiHf2oxa2lLLyWFU/r9295
 iQEjiGQsWskfo2aWD1Qia/9/7NEtPIsKyICFC5A=
X-Google-Smtp-Source: APXvYqwc6yPQzJeRMDwpBw2UlaTxNbd8Yn40I8XZYm0nIHcF7yUcod8fczsesKbhz/mRjYC+q7Z3CurTSUKXVUVYJPw=
X-Received: by 2002:a05:6830:92:: with SMTP id
 a18mr8893732oto.263.1570461508824; 
 Mon, 07 Oct 2019 08:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
 <CALLMt=rvTV0iUV9hUkXQyMF2yTOBQmfrpjZwqKD2X4LLV11j7A@mail.gmail.com>
 <CABoTLcSbv4xC0X=5R6pk9vkSG3PFAuO2qHVa72AtqOrSAczZ1g@mail.gmail.com>
 <MN2PR04MB66695835528F80F235765ED8CD9B0@MN2PR04MB6669.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB66695835528F80F235765ED8CD9B0@MN2PR04MB6669.namprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 7 Oct 2019 10:18:12 -0500
Message-ID: <CALLMt=obBgm1_1s_FSUr3gb2QPxghCt-9_ev5UcphvSZSntoEg@mail.gmail.com>
Subject: Re: chassis power status seems to not be changed when type command to
 shutdown OS
To: Zheng Bao <fishbaoz@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 7, 2019 at 9:53 AM Zheng Bao <fishbaoz@hotmail.com> wrote:
>
> How does the "ipmitool power on/off"  do to power on/off the host? I assu=
me it need to trigger the power
> button connected to BMC gpio, right? But I am not quite sure about the pa=
th which the message goes from ipmitool
> to gpio.
>
> What I have got:
> 1. The gpio defined in machine layer, gpio_defs.json, which is handled by=
 obmc-libobmc-intf.
> 2. obmc-libobmc-intf is part of "skeleton=E2=80=9C.
>     The decription of skeleton on github says "Area for initial design & =
reference code. Will be replaced with proper implementation and design docs=
. " What does it mean?
>
> Am I on track? Is power on/off gpio handled by skeleton? Thanks.

The out of band and inband path goes through this code:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.c=
pp#L1120

You can follow it to see how the power off occurs. But basically the code u=
ses
phosphor-state-manager interfaces to request the power off which then
runs the appropriate systemd targets.

I think the power button code goes through a similar path of using
phosphor-state-manager systemd targets but is not required for
IPMI interfaces to work.

>
> Can any big boy give some hint? Thanks.
>
> Zheng
>
> ________________________________
> From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org> o=
n behalf of Oskar Senft <osk@google.com>
> Sent: Wednesday, August 28, 2019 9:29 PM
> To: Andrew Geissler <geissonator@gmail.com>
> Cc: Andrew MS1 Peng <pengms1@lenovo.com>; openbmc@lists.ozlabs.org <openb=
mc@lists.ozlabs.org>
> Subject: Re: chassis power status seems to not be changed when type comma=
nd to shutdown OS
>
> There's also quite a bit of infrastructure on the OpenBMC side that needs=
 to be running to be able for the BMC to actually power on / off the host.
>
> Can you power-on / off the host using "ipmitool power on" / "off" from th=
e BMC? If that works, then the host should be able to do the same.
>
> Oskar.
>
> On Thu, Aug 22, 2019 at 11:47 AM Andrew Geissler <geissonator@gmail.com> =
wrote:
>
> On Thu, Aug 22, 2019 at 5:01 AM Andrew MS1 Peng <pengms1@lenovo.com> wrot=
e:
> >
> > Hi Team,
> >
> > When I executed command "poweroff" or "shutdown -h" in Host OS, the cha=
ssis power status seems to not be changed. Is there any package could suppo=
rt update power status for this situation?
>
> Sounds like your host is not sending the inband IPMI message to
> the BMC to turn off the chassis once it completes the shutdown?
>
> > Thanks,
> >
> > Andrew
> >
> >
