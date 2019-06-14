Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27D45CA5
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 14:21:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QKTZ5PqszDr4h
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 22:21:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="iWbnwpM3"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QKSL0dQ3zDr0q;
 Fri, 14 Jun 2019 22:20:17 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id c11so1484196qkk.8;
 Fri, 14 Jun 2019 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rc60klXbDdC4U4/MMrqWt/2TewJnLjQ/8r8hSCMd1s=;
 b=iWbnwpM3Kxebrp9DARy7xnFW6kr0KF6p8qC4q2EsM9P78mqslIAqRrIUj8ZBTUvZfA
 UiBAhtpSOHng8d69r5N05E8Pd9q3WGFt2mQ34gwLycRcYSw9+j8M02cm6srnmt9Ei8vU
 ZkeV7zq719zsUoqI2tf7K64TdVSLi9VimJ680=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rc60klXbDdC4U4/MMrqWt/2TewJnLjQ/8r8hSCMd1s=;
 b=oJNe26TFKQp/3x4y5bE9/XfxMkdOgNtx+PyOijgc7gBhFyWAuzOafW9lXjnghDt5NG
 TMHZglI/paD+MUEuYL3X8eokZW16hXb7DzthEtp9IyZNJLT8l2T69Irm4G3xWXOX3bx1
 R7QOEmEnBJGu1BXY73t9qJJXbBdxkeypo9Lu9G3WGIUHaq7he5oyA8V8TCSvrQBkuGzF
 wV5mgiMMm6sHhJF5j61zpnjGmXfoR8L92g8+67kmKvei05WB2E/QS3dh0VkXh/nDLzwr
 qzKxxrkgzW3cNcxTXa6yzZXsgP1sl2RL2eRquGdbJej1/w9e4V09qOokWqVn8qns0GyA
 dD5A==
X-Gm-Message-State: APjAAAXX2xfdRy/u4mpdDpvmpWcIcgTvxbHuflNUHSux78OsS4ikNO2h
 9zR97RV0G+keJupqyP3FYWGNOP0Efd1Pxe0RTHw=
X-Google-Smtp-Source: APXvYqyGrNC/mqtxIRaAuWze/JoTz2AsfNmSDrq8G4akumQY0TXEILTuIxe67BM5xQ23Pb3umDQ2KTDTek1Fgy9Gk4A=
X-Received: by 2002:a37:a743:: with SMTP id q64mr74518182qke.236.1560514813660; 
 Fri, 14 Jun 2019 05:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190509035549.2203169-1-taoren@fb.com>
 <29d7503b-6c14-4990-aadc-7cbce2897fc2@www.fastmail.com>
In-Reply-To: <29d7503b-6c14-4990-aadc-7cbce2897fc2@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Jun 2019 12:20:01 +0000
Message-ID: <CACPK8Xe8qNww18hJx2skjYJtsCRLA+uwZsjGUb50u6QLE+wmSg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook YAMP BMC
To: Andrew Jeffery <andrew@aj.id.au>
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
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 9 May 2019 at 06:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 9 May 2019, at 13:26, Tao Ren wrote:
> > Add initial version of device tree for Facebook YAMP ast2500 BMC.
> >
> > Signed-off-by: Tao Ren <taoren@fb.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Committed to dev-5.1.

Cheers,

Joel
