Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A665172C29
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:17:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7qn4c2xzDr7V
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:17:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cWdOaI6U; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7g6436fzDr7W;
 Fri, 28 Feb 2020 10:10:10 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j7so433001plt.1;
 Thu, 27 Feb 2020 15:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5tx0IPsAfgwG+TILN/HAZV3HlSTe9coOVs5pA2awyes=;
 b=cWdOaI6UdtYjvDDD78mRiRNwvqh4vFuOOlGGqiE2I6Dz3BJ20xeowNvUI2Wb2v27Yn
 jCmQ/RsSPS9CFnudpg/n87Vx0peDwnPbGM+Jl+K7UTATh2Slq3XcIrXKCp1cwyMdvcxu
 2A/9+o4vM8+eLh27IPtwmBmezC4QzHBLI3J3ccEMHbOeXHEOfamiT9WuSuw8OEqQptfS
 TPPGOuWkKH8SrWEZlDpgE2c4+T9o9os4NOtU1GEb+TpgyvvkF0cdbLZLBGaTt0fMRKdN
 LFkkwB9XlwrBhZqjKjps/Rt599MZQuKILqy/Wf3lZweoaZXVbTWOrGrU8FZhCaEz2NbB
 1AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5tx0IPsAfgwG+TILN/HAZV3HlSTe9coOVs5pA2awyes=;
 b=geWB8khPnc7aBGEMGXJELLye0AnYrx01XkkHDQMBdDCwo9SLlWZHeRXbKjUOMLq+cG
 02QeCu29Xrg5F+kD+hhL6F6vavrKS1744p3+Exfn0kqJb8Dijm2v5h8ZwpgeWmeTZRro
 Lu6ZjybanRcyMfmGLOTbEwcFencylHXQ1gSjB0ez1iEq46LXDWRWgbvgtDluPU7sGFJq
 m3tufTGr4wClnDeKCaMCDfXtOQFXgmLVdS5feOX0wJgwqPKRabQBvbVtO4GXZdmec/FG
 JJLRjzJRbTM8eTvyItPZWQ2t205lrza2lLyxSxg+QUw5VaRiZI3udAyg2G4FqqpcilhV
 C0Kg==
X-Gm-Message-State: APjAAAX9SxW1joE3sKEdMblZeKenTumxsCkwmtXlDvRXN8ruu5yZdw/n
 JVyDo+IUiTWSivPIMXHAFmM=
X-Google-Smtp-Source: APXvYqw09IN/MZmhAU4E9H1T2aLymchy26JoyYAjLg/DFgC719gs6v2RNo0x5W+jgVkjs460YxXpuQ==
X-Received: by 2002:a17:902:7006:: with SMTP id
 y6mr1191261plk.84.1582845007630; 
 Thu, 27 Feb 2020 15:10:07 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id u12sm7840988pgr.3.2020.02.27.15.10.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 15:10:07 -0800 (PST)
Date: Thu, 27 Feb 2020 15:10:00 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200227231000.GA31175@taoren-ubuntu-R90MNF91>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-8-rentao.bupt@gmail.com>
 <20200227165504.GA26955@bogus>
 <20200227224250.GC29420@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227224250.GC29420@taoren-ubuntu-R90MNF91>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, taoren@fb.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Thu, Feb 27, 2020 at 02:42:51PM -0800, Tao Ren wrote:
> Sorry I forgot to add you when including the dt-binding document to the
> series v4: will add you and all dt binding maintainers in v5 soon.

Just realized I already added you for the previous patch versions. Sorry
about the noise.


Cheers,

Tao
