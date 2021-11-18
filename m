Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75488456452
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 21:35:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwBPk2wL3z3bW7
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 07:35:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YS9n+asq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::936;
 helo=mail-ua1-x936.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YS9n+asq; dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwBPJ1sQKz2yng
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 07:34:58 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id az37so16483473uab.13
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 12:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=n9Yymj7rmoTNmXYB+OKzy2+vwBY9MLylCD2y++o2p8o=;
 b=YS9n+asqFY1R5lzWbRCFJYMu8LGVkc4ezIbv9XW2m33Ow2p9829nts3MDTi4tf1QM/
 9W2DBNMyGLkAvo5tk+FSG34dN/lXADB5cOMCah31K3K8t7OU/Wl4NLbfOyjddsUOWA5f
 vOgypqBB2SpYXzPBCsktJbTpNZoOaGMntvXn/I3CGMYbX5/F2Ueii4D0uoRGSum6bzkh
 kd4EmS3XnaDFGbZ+3MScQokULASYg7i12iJp5jlrcOw3tL9vA1fFJDJBM3T/MLRin0js
 YlhG3Pfx/LME0xJK8vjVxd5urct24TA11A++BP02Ka4HIbl3EpjYuRczBmhNsIuFq6FI
 aDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=n9Yymj7rmoTNmXYB+OKzy2+vwBY9MLylCD2y++o2p8o=;
 b=ppv8Ui3sVBfC6cXJJjM6lyksEz5gvNYwzMRCzfFoK40GTof3l6P0ID/A4+cVuQVXqD
 /FZR9pn+8wokM158pD0lsHI89l1d9AsFCIuGWV0e5jXET16uBLQ3uJAjAVs7F5J+8XmX
 lGPLe4iHoMu7a2XI4Epnx7A+G0xQhIliAFDBo1scxb1cnjqJvB9Rr+bUyYYqv+0lC3JF
 X9h1GsDAeQc2McqY9QK0zYO/FMBdcAPBbKunO/XI9plc5DcID//Y3a9VntNG8xkVF30q
 Eap2SvngG1MPwAD6rFfEPT+8EEJmubWFPu2XfqaGqFOz1Lk6DxEKAswQzwv4d7J9fsSj
 Sr5w==
X-Gm-Message-State: AOAM530XDZPCc8S9qWjQ5zYhDM7ZqLW+lmVk9T3uvpvuKkT36oeRjjV6
 iyCZD3u/DUj99sUvn0OBbIV8IrAEg721QNGrsBktnp8P8AwowA==
X-Google-Smtp-Source: ABdhPJy1lT5oHDnx0ZsKp7JS5/FkjukyNCjQBHdP2el4TYSVj+G85MIATXxpCUtItRj3TmxPRMrRYFzR/q/nWWuh/sM=
X-Received: by 2002:ab0:6c44:: with SMTP id q4mr24173924uas.127.1637267690379; 
 Thu, 18 Nov 2021 12:34:50 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Nov 2021 12:34:39 -0800
Message-ID: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
Subject: Using Qemu for BMC with a TAP interface
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000016b05305d1161767"
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
Cc: Peter Foley <pefoley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000016b05305d1161767
Content-Type: text/plain; charset="UTF-8"

Hi;

We're working on wiring up our Qemu BMC via a TAP configuration, and we're
not seeing packets inside the Nuvoton NIC itself (a level of debugging we
had to enable).  We're using the npcm7xx SoC device,

-nic
tap,fds=4:5:6:7:8:9:10:11,id=net0,model=npcm7xx-emc,mac=58:cb:52:18:b8:f7

For the networking parameters, where the tap fds are valid.  I was curious
if any of y'all got qemu networking working for your BMC SoCs, either
Aspeed or Nuvoton?

Patrick

--00000000000016b05305d1161767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi;<div><br></div><div>We&#39;re working on wiring up our =
Qemu BMC via a TAP configuration, and we&#39;re not seeing packets inside t=
he Nuvoton NIC itself (a level of debugging we had to enable).=C2=A0 We&#39=
;re using the npcm7xx SoC device,=C2=A0</div><div><br></div><div><span styl=
e=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;f=
ont-size:13px;letter-spacing:0.185714px">-nic tap,fds=3D4:5:6:7:8:9:10:11,i=
d=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52:18:b8:f7</span><br></div><div><=
span style=3D"color:rgb(32,33,36);font-family:WorkAroundWebKitAndMozilla,mo=
nospace;font-size:13px;letter-spacing:0.185714px"><br></span></div>For the =
networking parameters, where the tap fds are valid.=C2=A0 I was curious if =
any of y&#39;all got qemu networking working for your BMC SoCs, either Aspe=
ed or Nuvoton?<div><br></div><div>Patrick</div></div>

--00000000000016b05305d1161767--
