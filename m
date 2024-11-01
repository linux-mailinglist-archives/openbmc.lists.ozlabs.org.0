Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F509B9390
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2024 15:45:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg3Yl18rgz3c3D
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2024 01:45:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730472311;
	cv=none; b=Xf/HgwXmlc1lFJ1RnK0/hbhGcCVImgUnPzctPf1S8GVnANyCpYN1pbYKle17JoX3YDzO1S7EkRzdXF62iFzgMB1a8g4wV+FuIjTEOLglu0yyFkX2htoBmwxtWBf49J1fugr4yonxMKMYzGGn8Xu1qrWtuwZnqaUMVwgMC0mRyn2Q47a+UID7GdD9NRSCpuJDQHeG/ZqEOg35LBWxe1g2I8mP9F+s75rVtALoaBoS3MfyxJjZx8Rmhh3Fecd3ezFfEmcO7pSxh4IQ/5CUzwNM+YzFGkHDfpYMGM3nSsBNHPxDiNyleW0cmwqqKwVmUAcuZ8e55HxLw1JrWsUdipV0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730472311; c=relaxed/relaxed;
	bh=nFB9X8+bXdjRMgra+BnrPwuOPpZev8yICCAZV0Ubx6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qun6VvBxSVhH5fJBLxwvv19yedqtMWlkWwCyQ27fMzCEVVAWU45VyxCnFJsA24XjU7VrGd/tzPV0dwkKRXHdnBo4hEFkIgjTPjQClEYIo+91NyVS4/b1j2OFCwZd+yHq+SWucfxbZZZUWCIIBZPrU/VWd7qPB9IJO8VGlb08geXFmJR/W+Yzf7Ay9KOwFiEg81dGyS4LWc0uLNBnZOrpjkipH69ptH33nlW/TicxZDX/zusNG2b1d+zcVCJCF5loIa/PT0Mf2kE2CyK1JP7s+Cxwrp8TGWyiYtnc49lJmOJwXSVmvGpnbqQ2He+EJ8tNqit9TXxnN0JQwjMi8ZXK5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d3Mtd1VM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d3Mtd1VM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg3Yc6nKzz3005
	for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2024 01:45:07 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720d01caa66so673677b3a.2
        for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2024 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730472299; x=1731077099; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFB9X8+bXdjRMgra+BnrPwuOPpZev8yICCAZV0Ubx6Y=;
        b=d3Mtd1VMiH1nHapH9ZL1Fhxs7tpo3kGsSFXsykcC4/TRop+2qQdH47JAonVaM0q1S8
         wnW7ChRRBc3kbesu/Hll3/os4uTiLiB8Dn8F8sAXfkV/X/y/EXpj5Cpe6KAC2RXL6vKq
         zXPiMZXXR9tkdqXE68r9uTlHtOUk6y9XXjYrhsl4XGC4liI4TWiHHYPMenfTaJI3FhNt
         aVx370CvBwVxHQ8mk7s6iIpplbpZ35UCcirkZZ864H2l56YmpQAeJOtlD0r1BKVodLap
         +zFtSuskR18UpTb9tiNqjvWxOrRMfE+YFwuTXqIO5iokepCVyRJnp6sx50OhH8Mz+24x
         bLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472299; x=1731077099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFB9X8+bXdjRMgra+BnrPwuOPpZev8yICCAZV0Ubx6Y=;
        b=c18oANitmeSe0qtUvWUDZ+Bk2c6KOc5ju7+8HP03dZW2jqodT1mIrVnIppo2KMI9xU
         8VGXl/6oC/ybRz2EZiMAF88YNT9NIDlVr+elqUX23abU6sj6YlOeNnGXsdPeiW3ILJm5
         zHTo/DGSyv0jLJI7MCommxLXNSF53a18y0aCny85qWLzWu8l4YOqPaAwB3re82JN24i2
         0bZ0mNkDerHJpqPYQeCHv+YnL0CIiyPHjgDRG9Z9GAOukL6+tPuwFOJBxuYG8Ge32Ucl
         XFx+y9m64NNANY6X44TDE/UYwqE2/FMhx5ycCAYLgnSMbjT1E6wjGCdSVltI0wS2vBG6
         fU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuaytgbWKGXH0UfdD0qXznyWp997hs4a7JDi3C33NGHznzJ7XgusnqH85d3Qun+8tTfZ62Aep1@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyd/Xxu8rbM6VloyFJjTy31ycWg4AYckQWVhIEPku3dEdIZIZ3O
	L9ucHBIqAaVN/oyfkYEH9k2zy612DKkKHGxuD87PFcCJkM27sind
X-Google-Smtp-Source: AGHT+IFZY3czgShWLwMr8vZLa84ReNl80JQc2dqSAqMUDR9vtbY6B9GhV3hjeKXgXWBUnMGYXjB86w==
X-Received: by 2002:a05:6a20:d493:b0:1d9:111f:4b46 with SMTP id adf61e73a8af0-1db91d86c41mr9750731637.12.1730472299120;
        Fri, 01 Nov 2024 07:44:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5625sm2693424b3a.53.2024.11.01.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:44:58 -0700 (PDT)
Date: Fri, 1 Nov 2024 07:44:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: baneric926@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Message-ID: <9435b7e9-abac-4d02-9969-b35a50fb538b@roeck-us.net>
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
 <20241022052905.4062682-2-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022052905.4062682-2-kcfeng0@nuvoton.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Menzel <pmenzel@molgen.mpg.de>, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2024 at 01:29:04PM +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> Add bindings for the Nuvoton NCT7363Y Fan Controller
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>

Applied.

Thanks,
Guenter
