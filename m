Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF31613FB
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 14:53:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Llml3qw9zDqTT
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 00:52:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JTeaPukF; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LllX4qs7zDqXS
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 00:51:46 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 9so11913108lfq.10
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 05:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CWUnOwLrFtKopb+Y60N9EGpBz7+GIUoJzcWtgfbxsSQ=;
 b=JTeaPukF+f2GTlxgis2eIc6Eh3uBqTsFYQDRI2xfOvbwJqvMKIlC67SpE/WjBly5Pg
 onoWLb4ghtw99mSvYt4FPjKN8irX2uf7jKGvJaS//5flZNr3Ic5ygzPr1+yWhyRmyEXo
 y2pcz95ZL+O02jmtW9byIFgbTTPpj88t+UWJfmZI7ak9haLB3vtpKoP5IajaiuZmAtXV
 791SKL9sGfvDVFMw9kshnqD3m9KZgDPKNbOBQm48OVFHO8KGf17mvfqU2E3dZ61Wzd8N
 OK9nixjkGCBlyGncQk+5X/VjCKMuCf7KQAdqOGfB6Sr7oT6QgubPAWW0WgWvUuVBcbyG
 aJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CWUnOwLrFtKopb+Y60N9EGpBz7+GIUoJzcWtgfbxsSQ=;
 b=HWk8KTTw4kahqQ089CDW8JZAYwI4PfDmzBS3FggOJWOnzRZ/jH3siEQ7Zbn/Xmx3jH
 4AWXmhFMS23LLeHVhixhj9ckDs7kmVxkQlATR0pOPJrZ6VEijwgZACatQZJPhOfDgPtI
 iy8QFRUGg5wd9pTAgATfBvSQwhSLKYe3wNMK/yG8IJ8Mpi0GdT45DBAkyLq3kWHwCIkX
 xDSAzdkfPbug569bjcGEjoODXZmKZom7eMRMtiBiva3Q0a/fi8qZJ7OWRG6DJnUm9sa9
 mlI2XPc1t5Y2EDPEgm5jolbFRezaKETXDUcsU9vUE9gBGHTGvPk1RxxR7D//ox+6qUuY
 kpEg==
X-Gm-Message-State: APjAAAW3tQ/uflxd9AL2kdQlPEH2h46l53JrqrEBIHQvbCYgX8CogKcr
 QXES6MgjD6tNGvvDcjryH4pQQ0gB/+3Mgt7/nqU=
X-Google-Smtp-Source: APXvYqxER8D/hfn0d4TynDMh7hFSDaWVGBHDmUgoBmO8riwZNCOHQ7OOCG9qCnORtDTJYKSTchiiVWlTo3cs75r+DUY=
X-Received: by 2002:ac2:5f68:: with SMTP id c8mr7895674lfc.196.1581947498723; 
 Mon, 17 Feb 2020 05:51:38 -0800 (PST)
MIME-Version: 1.0
From: Tali Perry <tali.perry1@gmail.com>
Date: Mon, 17 Feb 2020 15:52:14 +0200
Message-ID: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
Subject: npcm-I2c driver
To: Wolfram Sang <wsa@the-dreams.de>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Just a reminder,
please take a look at this patch.
This patch is a new driver for npcm-i2c.
The patch has been waiting patiently for several months now...


https://patchwork.ozlabs.org/patch/1198846/


Thanks,

Tali Perry
Nuvoton Technologies
