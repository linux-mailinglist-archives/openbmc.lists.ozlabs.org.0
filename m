Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C76F8A4
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 06:57:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sTqX39M7zDqVQ
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 14:57:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=tajudheenk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k5j8JKx5"; 
 dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sTph0tSHzDqPM
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 14:56:22 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id f17so33873560wme.2
 for <openbmc@lists.ozlabs.org>; Sun, 21 Jul 2019 21:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Nr0PS+XWtzg7RsYkKXCFfendveheYInN8wzUyUYDawA=;
 b=k5j8JKx5tZtIYIXA0E3H7vdWJIIihIwBr+gh+NMIQiaPaHID/vsWNVNfg838ZaOP96
 fAcQTEpW4p92rTmFJp8Q0MxJ7TFWsMUlnYq6tLdzlm0FH8G0j3jY2XZNJlJS/9jBinDs
 2sBwpc+/qBzHMD8FcoV5qqtrM6rA3Xtm4EOR3URDqBJnctv+ybpuPAGzPke84+d+otyi
 xaPreHBgRKqI4xjbkm/l2SG4zrDjg6QoX09sk/fjvhg8nQOl9dOxizFcJOKUGPGIKh9P
 zdkSrjD9DAftzpxsv0EZMcd5qHuDiWRJ6j/uCn07x02uP8Upaskbl9GSjEc3S255y6xT
 9Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Nr0PS+XWtzg7RsYkKXCFfendveheYInN8wzUyUYDawA=;
 b=LW943Opn5Dd+mKyqOdShdmBwzBC1lLB5w9QozyaRScUshDHN+JgHfvP5z9CApU0ifW
 j5fgaVjsE4MQTbq5msxm45vILpduMdPluqfdebv60eo+TcCBRnb9So+L+TsiQBqcF8DY
 4Aip25BVO/ly2e7q48spHndB2hzuPXGgcrHKE79Fuzz2wn8EPTTBU+w2BZSbdqSnaksb
 Rb6mgbGHxtzkD2eyvoEjm8FWtzPr8nhVKc9CuXIRUnSsM4O9M/xfuCjsWDE2yUASPofm
 DrtvDYapFaA4gWRfUTYr85HW0I+nEQV1+WXPyTTnvrUC7lQkc3aUzKTe5MkPisMaDtf5
 ePsg==
X-Gm-Message-State: APjAAAV4Fag2gxFXKK5Nu5RwHXpv8J8plQCR8C5LA5SLTrzaqD+aTC5F
 7uHPEW86aTyQM7NYVFETxgitRLWxWxKjRG7Z1PUrStNM9p8=
X-Google-Smtp-Source: APXvYqzVqSJw4CT5RNWK9fjJvyBCkenboZ7depKN2f5zKm47MHu/nPDWUm0W8YHLmgiGsiiTK50w+6RbsMc3qCZ6UoY=
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr62564889wmf.176.1563771375531; 
 Sun, 21 Jul 2019 21:56:15 -0700 (PDT)
MIME-Version: 1.0
From: Thaj <tajudheenk@gmail.com>
Date: Mon, 22 Jul 2019 10:26:04 +0530
Message-ID: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
Subject: Multi-node support
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000593bc5058e3de557"
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

--000000000000593bc5058e3de557
Content-Type: text/plain; charset="UTF-8"

Hi,

Does OpenBMC support Multi-node server configuration ?

Where can I get the roadmap of features in OpenBMC ?

Regards,
Thaj

--000000000000593bc5058e3de557
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi,<div><br></div><div>Does OpenBMC support Multi-node server configuration ?</div><div><br></div><div>Where can I get the roadmap of features in OpenBMC ?</div><div><br></div><div>Regards,</div><div>Thaj</div></div>

--000000000000593bc5058e3de557--
