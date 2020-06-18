Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F01FFDC3
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 00:13:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nx5m2zN3zDrJD
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 08:13:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UaC02oSh; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nx5526mTzDrDr
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 08:12:38 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id l10so7710157wrr.10
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=POBgBl3MI/dA6mNJ5+hGlqrhujuUmmxFrJ0pjJyUNc8=;
 b=UaC02oShpxtI/MNfXzOqezN5e2CQ6fHyVgspS3Qf6YhYFCaq3LEhRQ+l2MfPPlnO1p
 bvxQzuJgfDsAPSt4CRMaWsNHSdAqUc4EBV9Wy6eygFu68NNNGaE35eDA+U+EqIsvltl1
 iUy5ALjPu6x9FrY1K9obF4jW55in+nio1robfbEM2zb7AAnczyLBp2bD5XBmUMZFmpvi
 NOsfeBFemydvFxA7pMkHJI+5MS6HqxALBiD/vYUTgckQwMy4JQxUZ2qgFGG8wo/gbx/+
 +o83wVSYbJHpQ/i8H7ER2YDYBp4Z0UBxzh2soQkz5eaZ+gS7oegrDmjsKd0xHWQOOn85
 jpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=POBgBl3MI/dA6mNJ5+hGlqrhujuUmmxFrJ0pjJyUNc8=;
 b=Yff2XL19Kls3fZHjkuWKB7M+wOvw0CbqIE3TagVOKaWWSNUXUOJH/FsEptXx0bAFme
 Fx/6icVeHjAgq7T6CI49MkXUbcLUnKS7V0OVu+TY9UyEykWLjDgMkc/Ukn1l+NHziv2X
 q/3UyhhhFixOg+sQPkplRTK6xp6zlVDWq+4dVLVYMXr+vQBSxgYJQJovTkRb72l7xn14
 J+mBqxLhESJJ3XaZ/wCQ1sddjmFLXDdhP8EhhEIqHOWvKnXtqYFMhYtpmsCY8/9ry7NP
 cHHO/rIvjVTPNyMjSAzdG4R+d2oM4jQuXz6aTID8vmxOVJi4YnMkDbJpYg3CNVlGIF9t
 WjWQ==
X-Gm-Message-State: AOAM53035U0hrzV2NmxyeUIPWpRMbWN47o1aNvkBGet96okqqmF4IM3p
 D/BX1nH1vAbm+IM5Wb0BPn8=
X-Google-Smtp-Source: ABdhPJx8hy6wOubeqxfTx/fn/AnNUMOEzQ6xLh5Mglw12uW4b0wv42gO0zYOEw+mTUgB1GWSiSN/Ig==
X-Received: by 2002:a5d:4009:: with SMTP id n9mr575240wrp.97.1592518352590;
 Thu, 18 Jun 2020 15:12:32 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 e25sm5677317wrc.69.2020.06.18.15.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 15:12:31 -0700 (PDT)
Subject: Re: [PATCH net-next] of: mdio: preserve phy dev_flags in
 of_phy_connect()
To: rentao.bupt@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
References: <20200618220444.5064-1-rentao.bupt@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f57e5c7f-88f0-d033-6f63-ab53addf9e20@gmail.com>
Date: Thu, 18 Jun 2020 15:12:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618220444.5064-1-rentao.bupt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 6/18/2020 3:04 PM, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Replace assignment "=" with OR "|=" for "phy->dev_flags" so "dev_flags"
> configured in phy probe() function can be preserved.
> 
> The idea is similar to commit e7312efbd5de ("net: phy: modify assignment
> to OR for dev_flags in phy_attach_direct").
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
