Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B33A933E
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 08:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4bXF06KZz30B3
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 16:54:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AG8aUFFG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=sampmisr@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AG8aUFFG; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4bWz1YQZz2y6B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 16:54:22 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id y7so1313417wrh.7
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mmGFV15biuA+oYSkdqF85EwDsaTJICc0NKNx5+aIEnU=;
 b=AG8aUFFGNTNrMg7h/5dv/C2W3mEmD6rD+ftldVwCDZO0oPm+ZIp8FCLjG7wXQrcFTm
 YCb1JRUHDe1fFY9UFB7kX2qMhi+jFeaRLl4bomp62+DEFgETH+MeltKldaVRC/jjkV3Y
 qZXYujkMo3pk1xdTV72ZJntvSRk4YDb40zBv7m62x+1v183CFQCl2yz8mFC9kToSjT2O
 a5SN/A6UQRwXapP1jsEYlXopOL7mbFMHPWwlA0LkTnwJubnYJxH+VLjbzyfvgOHc+xL+
 LBEe3qgIxMGke/QQ1H8E/HDNuQEa9SmwVuS+e6YmCIGzMbvxRJHqo+fCwMrmdjRVk02m
 FVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mmGFV15biuA+oYSkdqF85EwDsaTJICc0NKNx5+aIEnU=;
 b=LzR6C+ww2ohHM/x5l+Aryy3NKgLYmQCKd+dk1BygSkB4XJhuErTntSKVSrA4wByDP4
 0kC63ncNzDxHhwFBpIdlgHOtOk8/a/uAh0eTHtTQbDKk8ZnwTG8JvHqNiYjPndjgfpJq
 24CBjOrQiePehaS4TAnfiyEZSrBLO1gx+dQGkOS7yoOtVrWdOOPYQXIzqIgddBnSlxnN
 inH46RtMLW8Ld/BjIWEZQLaLZlqV560BCsDljw603H5dJJ17u/qkNqXmRrp80Xnyt6m3
 +8pm/K+OzkyMdnKHC+4Kw3025urDfW1fSQx7Ed0LTCD437fbPTiWO4r+ckVb/qvDvbSf
 jGOA==
X-Gm-Message-State: AOAM533YVURakAQLHZaYvvtp7vTfhctuP8aTSiBLRriTF9kpxa75h2M5
 IbIohjY0CFxKp8bpN2AiNOpSqw4B6g2SfBhHbfJ7/NG6drM=
X-Google-Smtp-Source: ABdhPJyZQoperUqwJMrE0Du7vVlrpVB+4XUQmb2rk9tEYJylnd+Zwg4J2jdMHiLX61b9rmjnwsofihWHDxjm69tWTO8=
X-Received: by 2002:a5d:6482:: with SMTP id o2mr3290778wri.79.1623826452755;
 Tue, 15 Jun 2021 23:54:12 -0700 (PDT)
MIME-Version: 1.0
From: Sampa Misra <sampmisr@gmail.com>
Date: Wed, 16 Jun 2021 12:24:02 +0530
Message-ID: <CAODBi=oSWc7pKrcF-CsHP06xRF77gtnsgwfhuzZ7Ox5V9N8sTA@mail.gmail.com>
Subject: how to model a card with connectors along with the slots on dbus?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e4b95405c4dc8e36"
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

--000000000000e4b95405c4dc8e36
Content-Type: text/plain; charset="UTF-8"

Hi,

At present the DBus modelling in bmc for slots and adapters is not
"/board/slot/adapter" but it is "/board/slot" and "board/adapter" and
there is no association made between a slot and an adapter.
But the host would require the board->slot->adapter relationship

The question is: What are the D-Bus paths meant to represent?
Containment? Technically speaking the slot does not contain the card.
But then how to know the relationship between slot and card so that
pldm can create an entity hierarchy like `/board/slot/card` ?

What would be the accurate dbus model to establish the relation among
slot and card:
1:
/board
/board/slot
/board/slot/card2:
/board
/board/slot
/board/card
/board/slot/associated_card
/board/card/associated_slot

Please add your inputs.

Thanks

Sampa Misra

--000000000000e4b95405c4dc8e36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:arial,sans-serif">Hi,</spa=
n></div><div><span style=3D"font-family:arial,sans-serif">

</span><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizing:inherit;margi=
n:4px 0px;padding:8px;font-size:12px;line-height:1.50001;font-variant-ligat=
ures:none;white-space:pre-wrap;word-break:normal;font-family:Monaco,Menlo,C=
onsolas,&quot;Courier New&quot;,monospace;border-radius:4px;color:rgb(29,28=
,29);font-style:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:left;text-indent:0px;text-transform:none;word-spacing=
:0px;text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"font-family:arial,sans-serif">At present the DBus modelling in bmc fo=
r slots and adapters is not &quot;/board/slot/adapter&quot; but it is &quot=
;/board/slot&quot; and &quot;board/adapter&quot; and there is no associatio=
n made between a slot and an adapter. <br>But the host would require the bo=
ard-&gt;slot-&gt;adapter relationship<br><br><span class=3D"gmail-c-mrkdwn_=
_br" style=3D"box-sizing:inherit;display:block;height:unset"></span>The que=
stion is: <span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;di=
splay:block;height:unset"></span>What are the D-Bus paths meant to represen=
t? Containment? Technically speaking the slot does not contain the card. Bu=
t then how to know the relationship between slot and card so that pldm can =
create an entity hierarchy like `/board/slot/card` ?<br><br><span class=3D"=
gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;height:unset"=
></span>What would be the accurate dbus model to establish the relation amo=
ng slot and card:<br style=3D"box-sizing:inherit">1:<br style=3D"box-sizing=
:inherit">/board<br style=3D"box-sizing:inherit">/board/slot<br style=3D"bo=
x-sizing:inherit">/board/slot/card<span class=3D"gmail-c-mrkdwn__br" style=
=3D"box-sizing:inherit;display:block;height:unset"></span>2:<br style=3D"bo=
x-sizing:inherit">/board<br style=3D"box-sizing:inherit">/board/slot<br sty=
le=3D"box-sizing:inherit">/board/card<br style=3D"box-sizing:inherit">/boar=
d/slot/associated_card<br style=3D"box-sizing:inherit">/board/card/associat=
ed_slot<br><br></span><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizin=
g:inherit;display:block;height:unset"></span><span style=3D"font-family:ari=
al,sans-serif">Please add your inputs.<br><br></span></pre><pre class=3D"gm=
ail-c-mrkdwn__pre" style=3D"box-sizing:inherit;margin:4px 0px;padding:8px;f=
ont-size:12px;line-height:1.50001;font-variant-ligatures:none;white-space:p=
re-wrap;word-break:normal;font-family:Monaco,Menlo,Consolas,&quot;Courier N=
ew&quot;,monospace;border-radius:4px;color:rgb(29,28,29);font-style:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:l=
eft;text-indent:0px;text-transform:none;word-spacing:0px;text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"font-family:arial=
,sans-serif">Thanks<br></span></pre><pre class=3D"gmail-c-mrkdwn__pre" styl=
e=3D"box-sizing:inherit;margin:4px 0px;padding:8px;font-size:12px;line-heig=
ht:1.50001;font-variant-ligatures:none;white-space:pre-wrap;word-break:norm=
al;font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace;bord=
er-radius:4px;color:rgb(29,28,29);font-style:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:left;text-indent:0px;tex=
t-transform:none;word-spacing:0px;text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"font-family:arial,sans-serif">Sampa Misr=
a<br></span></pre>

</div></div>

--000000000000e4b95405c4dc8e36--
