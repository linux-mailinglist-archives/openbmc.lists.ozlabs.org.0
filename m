Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1E409529
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 16:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7TgY22lgz2yKZ
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 00:41:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=caxbprpv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=caxbprpv; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Tg86brhz2yHH
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 00:40:50 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id ho42so21569283ejc.9
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=WcKVBvkK3edMUxoCqDZDshm4pGlfW5elmPARMt7O6TQ=;
 b=caxbprpvcfQRnVlzaQnSGp2dxoKUzT7hNHSyrpiZEMnJhY4l0xMxy9eXUipJSAWdXm
 WtVv28Vh/aYiN45M90L5GwZzUa7vJaYBeBRaRKAz9qDGV5QOQB+stW7/LX8wRZmSnUQS
 s8bPLEmgU2+//Og9sLC9713z0oZSM74geShbuC3g0LD+ABXOm8cq2r7/HgvhCbDCPT99
 Ys41Q5UgzdVfqC4rKhXsX5q1gKXN4Y/QZqXgrBx855jM4m3TPhAyVBM7BCAqm78EmrmY
 A/MRq3f995rqQVGcGEflfXnBKjV5tkxqbRPG40E8bZyyn5w9HT06YtQfdazqczMcUUzR
 r6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WcKVBvkK3edMUxoCqDZDshm4pGlfW5elmPARMt7O6TQ=;
 b=twO9JKTnfP6mvICmjwGI0bzR8wxeR6a84JrH/+ddOl+UlSl1pw/ELOi5ywKCf9hxwg
 I8ed2FS1fd5GklHSJUUBinSRCLE0I9jfjZHSlMwa0S8wTw8p9XZ/HxgU64IfWtdE/J+t
 5vPwIDll/75MV9IpzngEpNVdL9x/47/VDxOJbbVWFHIJH1tOUnXGgOJ/BQJSVsN6YudQ
 KQTuaILw/Y3YlIZSuYM/dAbNyvu3CUlacwYHrlgM/WEsQu+baulBMsmbHALw47yS205Z
 PYQzzkvkFFOp4LUAnnDl18B25vHArAYqe1lvhjmuPsHWVYlW0rngb0KScXZQBEu/9qnp
 NIuw==
X-Gm-Message-State: AOAM531SaiqHA1F+glpcPy86/q14PGCGfjghOGZkVa7gZNg2oyRVVLc2
 GM7c84O+0jqn35faXDzZuTw6JPUPN0lDF6BBUPU9+HtjIg8=
X-Google-Smtp-Source: ABdhPJxJjhC80ObP4z4IYB1cJ2/amiovzwLPWxEa4nTQbRADskQjBlPYNTt7oWS9boFZzaZ9o8lad/M82dlEdfL15SQ=
X-Received: by 2002:a17:906:4f97:: with SMTP id
 o23mr12812779eju.418.1631544046616; 
 Mon, 13 Sep 2021 07:40:46 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Raih <61a91bc@gmail.com>
Date: Mon, 13 Sep 2021 17:40:55 +0300
Message-ID: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
Subject: Read smbios2 file failed
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000055825105cbe173df"
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

--00000000000055825105cbe173df
Content-Type: text/plain; charset="UTF-8"

Hi guys, I am beginner in openbmc
I build openbmc with smbios-mdr repository and I have error:

Read data from flash error - Open MDRV2 table file failure

There isnt file in /var/lib/smbios/smbios2

How I can resolve this problem?
Help me please!!!

--00000000000055825105cbe173df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys, I am beginner=C2=A0in openbmc<div>I build openbmc=
 with smbios-mdr repository and I have error:</div><div><br></div><div>Read=
 data from flash error - Open MDRV2 table file failure<br></div><div><br></=
div><div>There isnt=C2=A0file in /var/lib/smbios/smbios2</div><div><br></di=
v><div>How I can resolve this problem?</div><div>Help me please!!!</div></d=
iv>

--00000000000055825105cbe173df--
