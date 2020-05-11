Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D01CE06D
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 18:29:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LRG436lxzDr7C
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 02:29:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zoc9PTSc; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LRD11nN2zDqvD
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 02:27:12 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id c12so14605969oic.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8Uvkyae9TVikoW3S19cuVbMIcNsgc1x59KbN8xJD5is=;
 b=Zoc9PTScM0yV2z7loDvXcWEaVpkOW/ycLTKfleDuP53OiEq4etXZepIlFrZe3NY8mE
 /h3+/d0+r0QEZd2FdzA51wWW/z3BFu1kvgv6fIsysJ7zkDd2/g8M8GBYoN9Gx9PZwGJn
 MJ7akIoRrJ4QPTkPqe6OSAzNDQavIsOSuyPxRNkx0baiaTwoKCgAOtliujpQjyFPC3PH
 gXqaLrSKVx+hxMWrOI64WPiwg12XAP8Ls+ooRGFhfts65714S6BMXTOJvIHQGSXMy8Uj
 En+O61h4wiM24pTgyx3WiR+mfYTNLZ+s28SMbk8HA6F9vUoZBMyR8leB2MuHG61ocDKm
 ArIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Uvkyae9TVikoW3S19cuVbMIcNsgc1x59KbN8xJD5is=;
 b=tsRbTbKieAKl91eTzuSLr2vJQATaAZaPoyJElUwEde3n29MpSskM78s/Q0WSLzpY9u
 w2wQDV35b8/Hwzy8fX0nh6W7CFmhPs8OPGHSflsc+gYWxBM5qh9GUnT54M4bmpZfy18+
 t80NX2huc+HaRhZNUclhKeCG0m8FdZ/Fz93QJALevs/OH8NYdD2XFBKXRFmqeZMoVVpo
 EuTycbGolzSFVRP+eUHPeUvSJyPPI3bIOro8BrRwtcaMh6koK3ekLoiE6pWaFCe12EkO
 JvC9uhXloS55JTHS0jt4ZbZrxOTGks41635tve08kO4zV8FOgltwngcKyLyD/WbeV0ga
 ueKg==
X-Gm-Message-State: AGi0PuZlSXkpf56iYcTefVXzfNTH4QRN6rxPm69zWEFcdsgX/f6nQiPy
 Jz289bI86XDbkOBkK13ogkmvO4F1y5Q=
X-Google-Smtp-Source: APiQypKnWNYv66ikx/KCs9CcGACuSbj3pUmNnzi5dyMWwLYYqhHmyoZ1dEc9tg0lrhjv8fGxKzlQdQ==
X-Received: by 2002:aca:895:: with SMTP id 143mr19519420oii.153.1589214427349; 
 Mon, 11 May 2020 09:27:07 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n23sm993244ota.37.2020.05.11.09.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 09:27:06 -0700 (PDT)
Subject: Re: Request to add CLA
To: =?UTF-8?B?67CV7LCs7JiB?= <park910113@gmail.com>, openbmc@lists.ozlabs.org
References: <CAB-G9zsc9kmcCSxnkLY4pWLDuV2z20g4pS-pmr-UHYG7QiTkUA@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5778f2a6-8a8a-79fc-f643-8bcbff1123a3@gmail.com>
Date: Mon, 11 May 2020 11:27:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAB-G9zsc9kmcCSxnkLY4pWLDuV2z20g4pS-pmr-UHYG7QiTkUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/7/20 9:07 PM, 박찬영 wrote:
> Dear CLA repository manager.
> 
> Could you add my individual CLA to the repository?
> [CLA file link] 
> https://drive.google.com/file/d/1cFjNkVnMhDhXx3atH-dNPQVLQgdlRCiy/view?usp=sharing

Welcome! Thanks for signing. Your ICLA has been accepted.

Kurt Taylor (krtaylor)

> 
> Thank you,
> 
> Chanyoung Park.

