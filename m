Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA85161C50
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 21:31:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Lwc61dW9zDqjn
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 07:31:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q9Fd/fP1; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LwbD47qYzDqZW
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 07:30:11 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id c20so17456953qkm.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 12:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=CQZd02d2Sum3mhat4Rosewb3J4uCP9boKi0gwpuxgZ4=;
 b=Q9Fd/fP1t4P7r0gDF4wPhCyMd5tq6YSEJ9HSJKyXMb2bBS/p6NNBof7u44/q2m6FWW
 4U6yZBw98A9dZN/AY6lLPpJf/7/Syw9exH+FCNssOEwaNTD+Bx3bZqUoyZ1jC+aIVXvS
 RrmKq+NT22OvKrSXaUEjBgN7j1d5eIt8zHh0UikxIEKU9U4FoSEw7i08+YQKzQ+FqUFM
 srCHiyI5jqJ0vF75NQVlMdTDpfH5HaAJjzZgiET385Qt0mtp6P9Y7ja/+CMxEOARBSow
 AH+qExSBjn7NyIyPDFQE4u7/DLxn7rxfiiTLveRhabqLLsgn5dPa+OsHBKyvK4z+wfr0
 M1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CQZd02d2Sum3mhat4Rosewb3J4uCP9boKi0gwpuxgZ4=;
 b=Mw/xRC1HSyE+4BZxsQl+Qbz/iBhXm6O7G9tAbx3ZjGDxkbLxezQpzovlPQiRhTyMOM
 nBNiaRKgsg3Xk6p/2kzw/AWPUrsINwdveDrlSehFFlCrZmdpaBzy1u0O6eXYrky4GlFi
 79yXhEPT59iIHDaC39QMS+unGtzHdFJ7IVwwF+986HmTHeV5nLah33IfzFeT2WmzQgA6
 xoEkd7KCex81qcOYK+wirr2E+k9XaUhbat9u3M2Dp6bmaSD/MWoyOjzn6e/QtKeONVmu
 WcGKJg7c3weTr9foTrlRqnauTBs6tbm7KYtby8ZrAEgz0wAqaTzxeRqcQqgQyWihW3H9
 n5DA==
X-Gm-Message-State: APjAAAU6WwmQaCmDK2U1lgHs8Y8dZeBxWi47BZQTZdBCAqei4pqLFOoj
 DdYzTtSEahASvUF3EEbo852V0f1q
X-Google-Smtp-Source: APXvYqxE85ehX/MkUTEQzrO0lU/KaLsXkA/A7sP952IWRGEQeOviCWf5cLwmZN6Idp5Y17HkYWOnyw==
X-Received: by 2002:ae9:ed88:: with SMTP id
 c130mr15041418qkg.299.1581971406693; 
 Mon, 17 Feb 2020 12:30:06 -0800 (PST)
Received: from [9.10.255.77] ([129.41.86.5])
 by smtp.gmail.com with ESMTPSA id f26sm735634qtv.77.2020.02.17.12.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 12:30:06 -0800 (PST)
Subject: Re: Mulit-platform feature
To: Payne Yang <pyang4@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <1fb78d4aa9394cf092194b57427251f3@lenovo.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <b3ea2d1e-e4a7-fdfe-45e5-6d5b50f3f4e3@gmail.com>
Date: Mon, 17 Feb 2020 14:30:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1fb78d4aa9394cf092194b57427251f3@lenovo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Same idea, slightly different topic?

"multiple device trees" -> 
https://lists.ozlabs.org/pipermail/openbmc/2020-January/020171.html

On 2020-01-09 02:12, Payne Yang wrote:
>
> Hi Team,
>
> Is there a plan to support mulit-platform feature on OpenBMC in future ?
>
> Multi-platform means 1 BMC image could support multiple platform but 
> only single platform.
>
> Best Regards,
>
> Payne
>
