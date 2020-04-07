Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A381A0DF4
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 14:49:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xRzw70ZkzDqSc
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 22:49:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZIW1UOor; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xRz83vTqzDqTy
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 22:48:20 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id u20so1350578oic.4
 for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2020 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E1oIzlCQJW1Q8sX4nwjeBjF7RxoOmsn5qFo0J3WJokc=;
 b=ZIW1UOoriZGbAmcI0yt+YKBeQWAXAiZBWNg0obVIzs7h9NGmOxezY4OUgIuM5dOOL/
 qUHIS/pZDC1bkWg2v/fjCBikCS6ZklW3Sx6J1jquGTjLei2HsBXsj1fYXqCHhq+/xHTt
 fPFkGqi5HTLNYiR+Ce7GA+TVVK7RU6I66KYP/4TRmFtypUm2xNJlryra5NvlMy26DyeK
 Hlc+s+citbsWAUeXz9SLY/cOvJmLjpY5iDhs0TnUEl1Wx8uXzJnPxNnfnx7VCsVe79Jf
 x2MEW6Ig3/N9lwjtKi4qTdehJMteVEvICq6LQIJGxvZWUT+p49UyCLtM+liG7voAuSDb
 2Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E1oIzlCQJW1Q8sX4nwjeBjF7RxoOmsn5qFo0J3WJokc=;
 b=XeQdv3VEVE/411nR5hIq6Aq4zFF/aBtr2ys10m33PUme8IWemaZf0IJbpwwhBzi47N
 fj2VhvMTU/nBHmsE0YTlDODs0E2H/h2B/8nCDhFZT68skZTL0z+IGIKgfmvHJop0uOSL
 B9BOXtDRb4SrbsLumPksxuSgtoLZ20mdaqualLDpBJRlTSDbLmt4azkCss64iLGsSSrN
 MAElyFwQIiKECm8srZMClKiZcVkUyI/XyDbZ3h9exz4NOvYuStTXCRzZ1jrbJ+7Jd00O
 /sRkzPgvsNWjbJJeJK/Gm5EykHWDPuwMO2iVMUpu05LOf3+qlwboBioAOcjTUqCZ/NkW
 FyRQ==
X-Gm-Message-State: AGi0PuZc5dPb9Imw1RPxEmS1IqGRNkBmO9Ds5efx0WX7oBoqLtsI4XE1
 7MBEZlCzVvmlVKF3Rw4rzf1ag8BzXcI=
X-Google-Smtp-Source: APiQypJOLYl9vpsI1Z/EMq7A2qSAtDIrWxkJDQD9Xy7T61IPMlCQorc9Up6/IPBkZqJDG2mn3dtdog==
X-Received: by 2002:aca:38d7:: with SMTP id f206mr1530577oia.62.1586263696344; 
 Tue, 07 Apr 2020 05:48:16 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id z12sm5306583otk.24.2020.04.07.05.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 05:48:15 -0700 (PDT)
Subject: Re: Signed ICLA
To: Zev Weiss <zev@bewilderbeest.net>
References: <20200403195123.6npsjcq3so6d6afq@hatter.bewilderbeest.net>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <ffc17920-9983-d2de-1232-946b48b02f73@gmail.com>
Date: Tue, 7 Apr 2020 07:48:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403195123.6npsjcq3so6d6afq@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/3/20 2:51 PM, Zev Weiss wrote:
> Hello,
> 
> Please find my signed Individual Contributor License Agreement attached.
> 

Welcome! Thanks for signing. Your ICLA has been accepted.

Kurt Taylor (krtaylor)

> 
> Thanks,
> Zev Weiss
> 

