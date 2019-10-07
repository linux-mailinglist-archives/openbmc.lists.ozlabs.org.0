Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7DCE49E
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 16:05:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n2LR3WJlzDqN9
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 01:05:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CdpFywZx"; 
 dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n2Kt5n7lzDqLS
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 01:04:50 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id i185so11708594oif.9
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HDjkrKntUgWgtqusup7ZiJnlD3JjlNqbyODsU/ivkNY=;
 b=CdpFywZxc9fmPPwqkIZSar0ttUYNTk3+8qs4eKRLmMcNEj3HMu6/t6u1Ze4U/gyRFu
 /pHc8elkRg+FGukVBmq49xOdrNWBkfZX0EIlwO/JW8Jlp+y6y8KwKsx/eR8IJL9DsMZP
 NlpkiZngf9InbTGFonGWV6u9Emaetmmxuqaca4IdeafdjJdUERIE58W4o+QC40X1B09o
 uGVxlmY0OSipVuI1xY5ezky1F3Fs2iFP3TFs2ghXX3W0qVIFjdqKzaLSwzGUodW/mB+U
 CFeahuPZwzu+i70TVTGa9CwCGbEa4hbGSD6ucQTaIYxLQgaL7GM+4yZaJbTCrqWl4mdi
 QRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HDjkrKntUgWgtqusup7ZiJnlD3JjlNqbyODsU/ivkNY=;
 b=umwcQtTlvCqkgHmuAcSFKN40EbzbzagRJWcrKmFTsUl0ZlLW8EWRBjqTu+S2dVAUYt
 ieWrJcvADyxq4XMcvkwaXCEHcC0grUNnI8VkWcZQBi2VsXXihnGRe6fnkhtp9rw6EKKW
 fp1QBzLvbs8/WM/73JscixBgH6rUDQSLCfz5CYB0JyTeriLZ4I8CdUWSYUWTkGjE7juv
 i+XS1JJr0uAyUqEzuWSyIsb+7v1k0XSZAi2YSLYUs2AD3i5BTQysmQ4wk+58HDetanb0
 x32zcb/0aWkPF6aq1k/d5vHssHlVzaYqxIVtl8l1fGTIhBfED/pUYG4DzO2VVAjET3Vt
 YiPA==
X-Gm-Message-State: APjAAAUbRMgSeH1ZQoMErJZMGgLsvQAZxYXLSuVcVfCMGFqqiqIw+3Ye
 E35EFpf++nDqKugYkt3L0BOKiJgo
X-Google-Smtp-Source: APXvYqx8sJiHPjY3KDap7q8PQccvhPUWPZ7+ifXla52X17y9t09mqYe8rNNUzwHIfPRCQ3oxPQZUlA==
X-Received: by 2002:aca:3e05:: with SMTP id l5mr17574019oia.10.1570457088235; 
 Mon, 07 Oct 2019 07:04:48 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c19sm4466023oib.21.2019.10.07.07.04.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:04:47 -0700 (PDT)
Subject: Re: Wistron CCLA Schedule A update 20191001
To: Claire_Ku@wistron.com, openbmc@lists.ozlabs.org
References: <50ecf2b3b9cf4730828657616083fc89@wistron.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e041b192-d320-52ba-147f-367238624835@gmail.com>
Date: Mon, 7 Oct 2019 09:04:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <50ecf2b3b9cf4730828657616083fc89@wistron.com>
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
Cc: Timothy_Huang@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/1/19 2:51 AM, Claire_Ku@wistron.com wrote:
> Dear Sir/Madam,
> 
> Update the schedule A from Wistron Corporation.
> 
> Please help to review it.

Looks good, thanks for keeping this information updated!

Kurt Taylor (krtaylor)


> Thank you very much.
> 
> Yours faithfully,
> 
> Claire Ku
> 
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 
> *This email contains confidential or legally privileged information and 
> is for the sole use of its intended recipient. *
> 
> *Any unauthorized review, use, copying or distribution of this email or 
> the content of this email is strictly prohibited.*
> 
> *If you are not the intended recipient, you may reply to the sender and 
> should delete this e-mail immediately.*
> 
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
> 

