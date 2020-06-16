Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2463F1FB4D5
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 16:47:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mWJ15YcHzDqfK
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 00:47:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LWnCPg+p; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mWG047NdzDqdm
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 00:45:28 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 25so19420354oiy.13
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LH4a5EQwQAzw3By45FgcKJkJOMGOXK1Fp5wWtGIFRYM=;
 b=LWnCPg+pyA4FhyZRex8or7z151PCxw2E4dpFk2tDC7fiWCoMoczva+Z8ZVpjG1HJtc
 q7pC5G+S1qr4nY2lF/+awZYsbHs3PIdpzrlUQirXPDB5dEGAOD0QrBt9Y1UToTpzUBYL
 4HHKqXxRfHVV7XUPXBxBwE8mEEflNUBIp0rrUhUrpF09H3t9/8lp4FyE9cesnvIJNUZw
 ESEriJTsSXYsfTYWzEbKdNlsPruZVwGonN2hsUPQp5Uiaf2noUOtPwOBp5QLHzgrCFFH
 uWVGwfysjLyPUfXDMBShCCYJCyahVLiDDlzKJY6gAxvfGtmOOpaBx9RbievISIGJ9/pk
 qHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LH4a5EQwQAzw3By45FgcKJkJOMGOXK1Fp5wWtGIFRYM=;
 b=hapKFKukQ6azmcyNSg8W4jBcOnbYkC/rj9d0gN3XvyJwAiiYb/LOFHHCVjyGuZHBgp
 CjsRgnJZJ9l6PGXHvfJMmeuJbtC5xVrU/nB4IgCS8uxoE3H3geKepTSDLZ1wMiJ7FVy2
 S840zoJ7bsqoIdJWtQqzq+KBMXmA0vrn8xg4oAcubfNUAsZaVy6031XnXJvrM0FQlEO5
 dNftfVD7roLDO2he5S8oxDoBdlC38KD9IDFjn5OTi5meTIGOGp4omQKs8C3juJQ5W04+
 CQc4G09/9bHGHwFDMy78QOaYh56ZGw/QxDQQMJ4gZ8sYjkFK4Sn8gn6wBMTQQJScieLg
 Hblw==
X-Gm-Message-State: AOAM5333yEBPHRTEabspdyXzCoFVT5CgbdnC73nWIgRIoWtufsYE/+Eg
 I+ndNGqrAMWYHfvP6zCSZZ/Pfa65
X-Google-Smtp-Source: ABdhPJytcmzkmiwTSWQeem1EyTHVuxly62jK+gBFbN3fBA4wWjKGzktgEoDDmxRUIlsFhIiUzJCEMw==
X-Received: by 2002:aca:3a87:: with SMTP id h129mr3417105oia.150.1592318725345; 
 Tue, 16 Jun 2020 07:45:25 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c9sm4046240oov.35.2020.06.16.07.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 07:45:24 -0700 (PDT)
Subject: Re: Redfish Support
To: vasant patil <vasantpatil2@gmail.com>, openbmc@lists.ozlabs.org
References: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e4fc7d29-9822-c48e-deb2-b27c4e46a462@gmail.com>
Date: Tue, 16 Jun 2020 09:45:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
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

On 6/15/20 3:25 PM, vasant patil wrote:
> Hi Team,
> 
> I am Vasant from NVIDIA corporation. We are exploring adopting OpenBMC 

Welcome Vasant!

> for our products.  Thanks Andrew J, Deepak K , Patrick Williams, Ben Wei 
> and Sai for your guidance so far.  We have below questions.
> 
> Is below two functions supported via redfish
> 
>  1. System Boot order change
>  2. Changing SBIOS(UEFI) control & configuration parameters .
> 
> _General Question: _
> 
>   * Are users allowed to attend the working group (like PMCI) meeting
>     who have not yet signed the CCLA?

Absolutely. However, any contributions to code, documentation, etc that 
you create and give to the project via a patchset or even email would 
need to be done under CLA. If you'd like to get that process started and 
have any questions, let me know.

Kurt Taylor (krtaylor)

> 
> Regards,
> 
> Vasant
> 

