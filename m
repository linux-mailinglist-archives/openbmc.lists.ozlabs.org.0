Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0678100AD9
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 18:52:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GxNl3D83zDqYV
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 04:52:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J0JIzLbK"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GxMg3fTNzDqV8
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 04:51:11 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id m15so15287461otq.7
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e+YpOPzto3TKgNPvmFKa7cJPQRgxUe4/Tu+lOyXlO8Y=;
 b=J0JIzLbK1BqEKCtbrl1MxIlCLcMgDYJpUm0w4m5vqfq6NYFxe4qMhNwZYyU6cOvXfG
 ZPhWU0uIZGbEGh9/KyL99DpabVi3Is041YwMNmpBWzpAfcd1q3FFizOnHlOutuL3Bw0Z
 TsbJzno4Zh3TINFLGeLxLubgLApUKOC5w8XG+oAxD+Aw0DiHV0HI2dCvbX+PxZ8gX8Aj
 qKQmA6WI6b/1O+07NhQjNGkuIa9VgP5VXvhZ3nTAuSfZQFWuPIE/H17SSYL8dIEcqS7L
 3hg5w6/12SHoGu/n+VVTPPvngaceYEweFdKbzk1/3eR1Z3iJOpPWMUri2O0I0CCzdIIG
 UoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+YpOPzto3TKgNPvmFKa7cJPQRgxUe4/Tu+lOyXlO8Y=;
 b=t2ai/dodUTh64DD40h8StFvj+KYtry9D0mZvgeCQ1aYwdFdHNPN/3crfEoQ5Ztu7pv
 5tirWLvggJmikJtS1GgaD6uT+lYr7h6435hdRsIs0WG1caU3CkMhFOiaK/kJZ+FM8RFH
 B3mS57EvFyzQATaTWKc1xeULtjd0lH5+RFDNhlHiPfeCuUOd3ODhsdddgy8VR7kmUuEI
 TMYmHd8MyJub0h6QPXcE1+EZjn/cUcORWiea8rSSyNn60TczcMO9tx6vMdAJT1qGGg8L
 VQsos3+ncMawC4/o3GB+L4FJ2ptTNrJaH8Z7CwMO1pmM/mqneelxT5/RNlaMeO8uGadZ
 td9A==
X-Gm-Message-State: APjAAAU6+UizUyELNyQ4fNw46o99anYouOXIj+SSyjIF+LvTNHzi1cgn
 75sVSOPOMwMiuh0WGPsAnpjvDFmz
X-Google-Smtp-Source: APXvYqzWMhzy6WE5HR3ks9wTAtZIYhdO7FZbJaLP93cKZZ1TeRWgCpEKd+T4TW6TSM5F+jc0cWEisw==
X-Received: by 2002:a9d:b83:: with SMTP id 3mr385810oth.56.1574099467781;
 Mon, 18 Nov 2019 09:51:07 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id i12sm6445004ota.10.2019.11.18.09.51.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 09:51:07 -0800 (PST)
Subject: Re: Inspur CCLA Schedule A update 2019-11-18
To: John Wang <wangzqbj@inspur.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAHkHK082i57zrv41kkxnXpLw_bWNqtc1Y4OCu6r30=MSifUpEw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b188cc9d-f961-5292-6545-5c543bc4b10c@gmail.com>
Date: Mon, 18 Nov 2019 11:51:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK082i57zrv41kkxnXpLw_bWNqtc1Y4OCu6r30=MSifUpEw@mail.gmail.com>
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

On 11/18/19 12:34 AM, John Wang wrote:
> Hi,
> 
> inspur CCLA Schedule A is updated as below:
> 
> Initial list of designated employees. NB: authorization is not tied to
> particular Contributions. Please indicate "CLA Manager" next to the name
> of any employees listed below that are authorized to add or remove designated
> employees from this list in the future.
> 
> Adair Li
> Albert Zhang
> Alex Ning
> Carter Su
> Chicago Duan
> George Liu
> John Wang
> Kiuyi Chen
> Lewis Sun - CLA Manager
> Xiaochao Ma
> 
> Attached is the PDF file
> Please help review.

Done, looks good, thanks for keeping this information updated!

Kurt Taylor (krtaylor)

> 
> Thanks
> 
> John Wang
> 

