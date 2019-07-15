Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA568EE0
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 16:10:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nQR2104ZzDqNN
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 00:10:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ug0KbVhQ"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nQKZ061CzDqSJ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 00:05:37 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id m202so12725312oig.6
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yjYF+KKSLOq1mFBORtnXdIjHKse3hh39INQbobnhIO4=;
 b=Ug0KbVhQ27BxTACQNax9aNrNCL2OYniv1oq5Wn24YwUQ4teqZjhRHEo9/JaRtF7VHN
 INWsOYAR7R+espjF4oxSwKqkLq/IV1+zJfdHKkOYMt9vMBe9VV/7mrVf56aNoby4USxa
 N1Bn2i0VsYp91h3pXi5NcHOAMTZNONyvna4JF1qgCzG9N7B6V61VLzIinBl7donRA1MD
 NZXByxLucgzHJbekP1Ngzs32YIk/4+nu6XucE0rHEDMwczWqaIk14KqQj/Ei7r4bMRNG
 4YG7hIEJ1LXje286r7bwVls9et3JoWoKMd8NL/sOgerqvAJO5R9LthsuTvOqyZm262xB
 Nnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yjYF+KKSLOq1mFBORtnXdIjHKse3hh39INQbobnhIO4=;
 b=Bxdkchw+dCHsHtnpYZbe63Zdj5WohjfTy2I8lu+ZUHDTYE2DOehOallQl4e80/N+uS
 zHeaFrFuqPUkaidZnPpZOSCBZ65MOWe/p7JMGuQP76H4uCMSL/mDxaLd2Vb7cPGJV7Cb
 Hfdo9sfb2G0lco9t0kq0e7Lf8YBg8EhyKNKOuKiBCOiJcDwRBlm5vSS9uDFqIufSU8k3
 amHW2FHX5p3Mam7k4hB+PE1zuDr7EnCmJpsaTv3xkLaQPQiTROJHbMRvBABT3/4cG4D6
 MyJDQAXoDNxNMFDH01LhhijrvVehxFOwSdZNZVloPDQH4lEOdVjsXu5r/8N1/8FJWCZp
 eePg==
X-Gm-Message-State: APjAAAWRiOyBnfkg23FjQwYc1ri7zo/15qBuNy0s76mJbivt+gCMjMM/
 L/3E6bS45xDqK5nxKzAmfZt0oFiiFoE=
X-Google-Smtp-Source: APXvYqzQq++fpxmAPu+1StFAJAm87PLUfh1Kjc0VGLqOEUvhdeJO0VZvN11xDjuow0XeRO2d3xjJ1w==
X-Received: by 2002:aca:b2d5:: with SMTP id
 b204mr11888131oif.101.1563199533670; 
 Mon, 15 Jul 2019 07:05:33 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n95sm6677128otn.65.2019.07.15.07.05.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 07:05:32 -0700 (PDT)
Subject: Re: CLA for Raptor Computing Systems, LLC
To: Timothy Pearson <tpearson@raptorcs.com>, openbmc@lists.ozlabs.org
References: <1601006714.273471.1562959285670.JavaMail.zimbra@raptorcs.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e72e83d8-365a-8519-8ed7-614c2be82ddc@gmail.com>
Date: Mon, 15 Jul 2019 09:05:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1601006714.273471.1562959285670.JavaMail.zimbra@raptorcs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 7/12/19 2:21 PM, Timothy Pearson wrote:
> Please find CLA for Raptor Computing Systems, LLC attached.
> 

Welcome! Thanks for signing. Your CCLA has been accepted.

I did notice that there is not any developers or CLA manager listed in 
Schedule A. Let me know when you would like to update that and I'll add 
to it.

Kurt Taylor (krtaylor)
