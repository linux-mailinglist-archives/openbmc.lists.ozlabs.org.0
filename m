Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D39B93AD
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2024 15:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg3dh6nRCz3c52
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2024 01:48:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730472517;
	cv=none; b=B+K/TwGgOKO/oNbM/W1vYWkNhrmjWxBdPH6g6jkD3KuDr4qcKQdnTekaIvQJrfkGhKR77sSudUvaNA3IJY0Xhq0WkJVAjkInjUWUTztTJpLSozRMlQEg/kvLOTIqrtC4VXevN7/Jgi94VSLSOR0aPfYKYhZL7+tO44n4pF1EBp2GHRMDVkeYXRsugryqjQVOtI9NarteshqsRkAM31EANLE2pMoGlHHLq0znawXFyaC/XoZz953v08+ZyvvIoahmIy0TG6t7G2HVMio0oT0wnl2WWYixFpd98YEk481cFx+S3V9dukiIBrceEIqgbIdpIhVA4upYl665IadGeQ1EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730472517; c=relaxed/relaxed;
	bh=ikLF17TGv2d8/HjXENzyIcikHXnbEzedUUKC+eQvlMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hng7JzNhSyQZzoUd/yoOYozOc1qCrWxj2109Ru0KOhhNAwO2axP8HqnOXXhOVrc19HoaJTXYLsTdMG1UnY0+7b9OdTq0fVV76Tw/hVS+q5dAaIRlPRmXFzyW6NbxKXYznG0NihhQD9GrOI/kD+2vMnfxOjJdTY9BcFOoOurQqbZA8OlAIKTMYwWPsNdSA6o7Nh2prn5ViMS1NfLOr3YorxUTnoKbberBK8NzAIAwR4hNJoHe++b1mFoyJXPk6AbdSbSNHXJeBC/t3cJDCm/vX4xj+3QFHRqbT9lW4I/yRQ/v1X0AsKEapcsRU60jBMOxOX0YzQPo0prgzY7PUHTWPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RK1DAAjd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RK1DAAjd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg3dc4cdgz2yx7
	for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2024 01:48:36 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so2420121b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2024 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730472514; x=1731077314; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikLF17TGv2d8/HjXENzyIcikHXnbEzedUUKC+eQvlMo=;
        b=RK1DAAjdKdacKNMOqYtY3WtpPj2ZGdi/xQ0mDMgb3TMiuXi+KfhGXu2XXndsiZVbfM
         BmDW8rTulSmIbCGMBmGCD/y+uzBSMR5K4/PP2AcWfZfASMPtczBTjtycu9jAF501YAfg
         zpf3cWldxFQP/O3Ea085fdCAYyWdsKZn4lGlzUJlgeubPYQ8mhVEAZ/6IBf9mO+9Bts5
         K8FfNtHXEyi6njf9qHxKk40OfCzEz1RFv32KrjCGEkDNfHRjrN8Hk1BrUUNujtM+KGtk
         I0vwcuwODXDw87JM3VkxRGRFQa6vj97J3QIH4fN/RYgBvJsCpo5ygxDyYL2hYDvA1mr1
         jejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472514; x=1731077314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikLF17TGv2d8/HjXENzyIcikHXnbEzedUUKC+eQvlMo=;
        b=pE3FZJbcvQFJcw6S3p8y3llF5GWfwNUqWOmnPCwMTZZeWtjgqU5ABEQJe55e+KRLu1
         ye4VmhHH6I7HDIWd1bE5hYcBUrevfPnke6sV7Wcj228D/DIsbTNpnOyxQJoGcq1n+AQt
         5qfrYUFn6eriD7/QUgA5F0eiU6MR/4Nz4n7w6CVgzfmjiG8BLhJGgJtrmnETckvE0QEQ
         oWot4o79EV86gxSFvoVTx5JfC53dW1y9Wi/BxnkE45SebPW23HBq5VJ/QJd8bVnszhmG
         q5Pazx+I987jVEsJOF1g1T3iAedTHsEIMgvmRFxUbH+xCxuGICklkcQpWCU7OnYr7r3U
         upJg==
X-Forwarded-Encrypted: i=1; AJvYcCX/M4EAGMDCEho+S4qptT5VgagpReM8vwLYUOUbCwB7CG2hukQHm20stJd47QSBf5yAJTYdv1Yq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuOed/14NWXO3EqTfV6hhO6dawwwnUgXm23OrkiYIyKtwf1S8r
	CIfjv+0EcRNpBm6crgSuwcDz7fXVDPvpZJ40sntKIfsvIB+sGtOZ
X-Google-Smtp-Source: AGHT+IEud0i2QRxm/ssibxG0ytuDAv7M+mnTsOZohBA1h7lUg1MTloaGNER2mbVW0mDknyn5OpCdQQ==
X-Received: by 2002:a05:6a20:4c21:b0:1d9:15b2:83e with SMTP id adf61e73a8af0-1db94f6467emr8939450637.7.1730472513686;
        Fri, 01 Nov 2024 07:48:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8987sm2745643b3a.7.2024.11.01.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:48:32 -0700 (PDT)
Date: Fri, 1 Nov 2024 07:48:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: baneric926@gmail.com
Subject: Re: [PATCH v6 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
Message-ID: <319d7395-680b-478a-aec3-08bae9177f73@roeck-us.net>
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
 <20241022052905.4062682-3-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022052905.4062682-3-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2024 at 01:29:05PM +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> The NCT7363Y is a fan controller which provides up to 16
> independent FAN input monitors. It can report each FAN input count
> values. The NCT7363Y also provides up to 16 independent PWM
> outputs. Each PWM can output specific PWM signal by manual mode to
> control the FAN duty outside.
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>

Applied. I did fix a couple of the nitpicks raised by Christophe,
but I did not replace for_each_child_of_node() with
for_each_child_of_node_scoped() since I can not test the code
and did not want to make a functional change.

Thanks,
Guenter
