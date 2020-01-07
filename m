Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD7131DC0
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 03:44:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sGtk4RBDzDqNC
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 13:44:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PlPUMN7d"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sGsm0d5HzDqBt;
 Tue,  7 Jan 2020 13:43:55 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 21so41466525qky.4;
 Mon, 06 Jan 2020 18:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LyWXGqlpcvNUsV6/byFCrmEtMHIShb1ijGFLD53ibQk=;
 b=PlPUMN7d9Nn66k3HHa44pNzYSnqyDuDqc2kzItmd2CaBY4trqh7Qe7dWFGJnuw8DHA
 V8j21PR63pR83jsce5aby7Nm3lDKA+lc9frixN2s+Zn3eolm3vFF1bGBtiCC7S2rymav
 O3DjKq05MkPObXSKhaa66XDt5q4VXdt621cWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LyWXGqlpcvNUsV6/byFCrmEtMHIShb1ijGFLD53ibQk=;
 b=j6L5n9q/KpA3oJ/q5xFOIBLVSYV9OlX+BELQ25OYJ0SI6bPeSk3VDEt1eDfwbtMNvt
 0sPsME7b0zVgXgSS1XKQbMQI19YW5V2tWCiThYlp2YceZcoRll1KiD9+ha9/uhoU1L1D
 BkaUr6azf1i0GBFXmBLwTJTT0g0LuojCE29QR6zgqF6s6uDda4z4Q6kSFy+NPD3ydSir
 5t3n5u90KQQ0O+xpCRrdOgi0ESJAzbpPyZylLMOAAtcTHpzdlFdPzOW8DmRtd1sT3JLI
 1Xtddj0ExS/fssgp5ZWTir9GGHyfqVOooDSdo11WY+3aYwv11UdnSg1U2RVwtP9r0AzC
 wKeA==
X-Gm-Message-State: APjAAAVYJPGDhU2Ucvf9uRomRcNOVKx2ph4rlQfTmVfU5Vp/5XxkbkaY
 lrWJHZO+16pHwyr9sRhc2jFElqF1zmNgR8G67I8=
X-Google-Smtp-Source: APXvYqyBIRxMo+kjMv9ML/yu7Ter7COQGfOpYifJbteEuBwqpPXih62HhMK1UnjdlPXu0XOWSax2OmNtaiyS34TkbnI=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr86645362qku.414.1578365032850; 
 Mon, 06 Jan 2020 18:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jan 2020 02:43:41 +0000
Message-ID: <CACPK8Xcf7TOWh673aQwOk385b2QaMT1i7nUHy=18W-rVLX9ewg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> The AST2600 has Video Engine so add the compatible string into the
> document.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>
