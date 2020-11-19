Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9E2B90B4
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 12:15:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcHC92101zDqdb
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 22:15:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kdc88Aq6; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcH6X2gn2zDqH5
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 22:10:59 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id h21so6369489wmb.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mRlqAP0XyMOC+qSlYVzWceJV7ha5eCvYW6r0b+TyvYA=;
 b=kdc88Aq6uRAE1/3UKGJQ0XjECOz/7ncIxyTgp0I1hXx/lhxbZ/qMmW8FZo1lKizeBV
 8Jnckwyc13FxAIziYokoFLKCdqtLwXv9viu2xtwScchM+9HlUKL5wWcANFHkxpoiEdr8
 8y9jN+H3rZVwFHIFXalqi1g0kznKmy4qEGLuyav8ty5FUXeIoCV+n+UEVcIK5BRTSMOI
 qBwHev9mNzUHr2+RX1F73jb57LVBO74BbOYtHFtJVjZI6p2hWQ1Cpa4ufSCTeiDNB888
 gIXRnF8S9boQCKbqET083y9RYILMemMKoayB6FBWi2eQmLYZtz1Unr1JLWUj5rxS7D+u
 FjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mRlqAP0XyMOC+qSlYVzWceJV7ha5eCvYW6r0b+TyvYA=;
 b=iKt0HTWTvIR/3lH+MA47wwMVbfWs9zG8u7YSzywDWbrR7ob6HtNkxRSoVsozxJI+gh
 qTgy2LAwMiQ+WDV9+Wbg9vZD67451JtkkrSMVqsCoQ8zuvaLbzSW4UK/NB0PJt2da+wq
 g5PJkyHS/rLEOqBmN2WyCpSDtfReQmtMhkNBtC0jsL5lJYJy1Bwlrn8Ymhlo4DZXsXyv
 W3WfEM8tJNI+z2G+YwgpVM44LmFHWPSORhPeV5uh3vT18ppGAG4gGAooSpZ6SW76DIUy
 VPeqtr701977YPqvYDnkWDI0XkD7+dCcfE36EvApqT6C2uX1wldXipKJ+HUmmx18e9I2
 miig==
X-Gm-Message-State: AOAM53353YHJxNIYv0TYM+kbqKI8yRsFYGKsT/Ee8TtSShouCR/6+PKZ
 IYt03GU08+gQRnPOp10ibIJ96pEXw8ecoqvEzMxZOTAgy4A=
X-Google-Smtp-Source: ABdhPJxZpo8ogmtoGvSsbhI+phv3QWot50MIgc0+KNcDKaBIXyOw6ycJi1/xJNSeGDgc4HUcbT1mcEqv7tNzcZZEUSE=
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr3864772wmc.172.1605783772486; 
 Thu, 19 Nov 2020 03:02:52 -0800 (PST)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Thu, 19 Nov 2020 16:32:40 +0530
Message-ID: <CA+FKyEWtGpmB9P4YUryOprn7GG604f27MV27KAG6bs72zNo_ew@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Firmware Update)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000058612f05b473ab8e"
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

--00000000000058612f05b473ab8e
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new Firmware Update screens
in the WebUI:
https://github.com/openbmc/webui-vue/issues/44

Thanks in advance
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore

--00000000000058612f05b473ab8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the current iteration of new Firmware Update screens in the WebUI:</div><=
div><a href=3D"https://github.com/openbmc/webui-vue/issues/44">https://gith=
ub.com/openbmc/webui-vue/issues/44</a></div><div><br></div><div>Thanks in a=
dvance<br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span sty=
le=3D"background-color:rgb(255,255,255)"><font style=3D"font-size:12.72px" =
face=3D"tahoma, sans-serif"><b>Parishrut Bhatia</b></font></span><div style=
=3D"font-size:12.72px"><span style=3D"color:rgb(102,102,102)"><span style=
=3D"background-color:rgb(255,255,255)"><span style=3D"font-family:tahoma,sa=
ns-serif;font-size:small">User Experience Designer | IBM iX, Bangalore</spa=
n></span></span></div><div style=3D"font-size:12.72px"><br><br></div></div>=
</div></div></div></div></div></div></div></div></div></div></div>

--00000000000058612f05b473ab8e--
