Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2D134DB4
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 21:34:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tLZZ0JCKzDqP8
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 07:34:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tLYQ26ZszDqWw
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 07:33:29 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id a67so3884599oib.6
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 12:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u9lGx1KGncwRhu5gmclKsigxLVgAIjFaP4Z6LNjc8ZM=;
 b=qUUvDSl65z6F2rK5/uXqHjh1r7c18Mg9+oVdYV1zIHSF7PKcmvJ1HFoVYk+ksoiQbJ
 NtQ7NseP5h25gmZ1K0J6k4KlT1OC5aBPV7arZud/mJbQ98rhD9voH47oWJtUZB4/czTN
 XKpbzqRqX83l95o1wNOQ8k1ohY/jYiYemAOSck5xBPQ4ZW5BV9MvKHiKXwUmL73DcLQy
 PoNthbx32g/hWSxWPpXOiQ3dN8pIeEwRskFk6EXpdChMz/wWdKb7sAe18EMEmU7fe0wZ
 Tj9k9ftTIAruC2jNTfwhsHGXgdF3+AnqD49xnhBwxzdE1y4Q+CFp+CvTPwlvrxjBjcB9
 o3mA==
X-Gm-Message-State: APjAAAUMI6xD2EP8/UzTb97kZCSkkdtsH6O/jrj6xJqsZymodSf0REaU
 ZavfN38Gu92QHrL/pnnnGq9mLzI=
X-Google-Smtp-Source: APXvYqxQkXQF6pn6spjcuwQ1o8xcXtlj+8QoWbpzEMGk3Iol2K2b2dgtriLEAB3gBzgEjR/pzVeORQ==
X-Received: by 2002:aca:af8b:: with SMTP id y133mr356875oie.73.1578515605597; 
 Wed, 08 Jan 2020 12:33:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y13sm1459076otk.40.2020.01.08.12.33.23
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 12:33:24 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2208fa
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 14:33:23 -0600
Date: Wed, 8 Jan 2020 14:33:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
Message-ID: <20200108203323.GA18757@bogus>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon,  6 Jan 2020 17:15:02 -0800, Jae Hyun Yoo wrote:
> The AST2600 has Video Engine so add the compatible string into the
> document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
