Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6296CBED
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 02:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzgq45lRJz3cBd
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 10:54:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725497645;
	cv=none; b=bhl9UYFETKMpOGcqC401ddJfKoI0UmB/gB8qgxLgTBzbgOoezEo2qIxOzNr1n4wK3gGWxvzfQbwr+js5S6OI3E6UfHZiMvcw1XmEdBLFCdgpRcLC3JUO/u1Swo0/lkbIkWUT4kPsE/T42mPFzW175m8a0zDRGz1y5iNsA9AwWZoGRPBW3WpvjNKAs8XrS3GiAgnBV/hpbYmon4wS9PkAvyBqnpkL3c4tjdewAljqa5QtOW0+SLd0Wqsu/+Pu6/f+4qRZF6uks2XBfEZog2kfeNLEZj/efZWCOzubL+uiW3W5BfsIVzY52wTRcZVdPKCAf+MhPYlud2Uz6aSYab7z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725497645; c=relaxed/relaxed;
	bh=YIVSb85em2Yg6/aay10JxWCY81K4KilBascU/RxXw6g=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=UbW66ugjmx2qzCvRxa52lvvofjiPduzJe3mAJy/ikbvS1Ony3MVq08K4ipKGECGeWSbxrijHQe9OvmlKj0KDF/Jo74E5y/FicQ+RDUBeYWszH9YtiXUKaCJlmtHVnIstf1nlV5aXPgPZHKcgA/b7ZIz4gg0roiKazDz4BkKuzkxDiv8Tr8QLKfazMu3dhMWAUrVI0PgCAOYhZHb1CD1aCgSCxXSwt3jC3z8kjVKqseuhZwfXoD8eV0rqlumcZ9rAXX+THYtaalgyB2ORf9yYcI+s5MTueYuKUgTcnosT1hdIvcrtwXNGIB6bbV1l7XxK0ay0jbigoTc9hsyjrHE4eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bB99qk/S; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bB99qk/S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzgq13rKbz2ynn
	for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2024 10:54:05 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-277ef9a4d11so158538fac.1
        for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2024 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725497637; x=1726102437; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIVSb85em2Yg6/aay10JxWCY81K4KilBascU/RxXw6g=;
        b=bB99qk/SMjANvj3mi1aPPR5cR4t7NPwYAFMIIx4NI0xR9PsV9TLPGmiNgqkgDVc3Aj
         6bhpE2oMJJW08G5J5TIotpd4drAJ1DZ3SPpnB4DkrgopuLSMu08vAa5qXHdbs9SykLFE
         TBuEYX8Ym7YS39IdUZ4y1gAlZX94atodvZJ4qP89SkO511XqaUTqPpgam4VHl1xL3O/M
         LHRTbpG5ZkLgQrwQzwWqvM/AdDfMaBZtWm7/cXwxXOxtNl/aOHq8/j+FzUhZSqgXEEhU
         S4u80tnEH0EKJoKifN57gHJtaR3DfqRcOJ1lTOq04QM9Xe1n4Q/9Q+VhMClAXhgf1OX+
         McmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725497637; x=1726102437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIVSb85em2Yg6/aay10JxWCY81K4KilBascU/RxXw6g=;
        b=AwlwVh3RV6mw8ljLWFlVYQ4dNI5TAb6AB71BQe4nj+T0vmrrSdMIqHF1L9eHDQHpAC
         dpPIC6CVY7izMOCNcgN/QxIS/4J5fOoaGaHiTGzrqGwQJgl2o3m+TN8oXHs+a4rmgv2f
         wDqDi1C0JuDzS/dPwLTlyxpu2IH9rOYCqpBwCqsR6H8aY3dNjWKMbNKKUxtFMRafUaYQ
         zJy2A8Am6Xf0bFi5TTC/Z87TAlsuAihvsWTHN0zc3JMdt0x+KfPXRoIXHuiaEeZzWYl6
         VnFiDTZ+UQBPIASCpc576X9imF8b5rjAsoTg3+jX6IJJ+2gcQpGt4UEGvjGEnuC0g+Sa
         FCBA==
X-Forwarded-Encrypted: i=1; AJvYcCWFDaoFy2D+h1tzM7luHpd+eL4gOoDZu3Tc/ozw3iTg4WoGockUmXXo4bAe4Ycj3KxB1AkmmrLn@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyo8IPjIka9OPmFgv5Xlgqxj3s2xLpIiGwI5wpClyPMhYdBZVeg
	o4a9+FoGHd0ZJFI37czBK3EgqNnZTsNXKHRQe3TAy6qY73yDpaKE
X-Google-Smtp-Source: AGHT+IFTPRkenl1j+ELFaCtS22fW/r+KtikYn64moGfzDZMKAY6H1pvORs+llIldLw55ihL1Z2/m1A==
X-Received: by 2002:a05:6870:1583:b0:277:dd4f:3c7e with SMTP id 586e51a60fabf-2781a7e1834mr8671947fac.24.1725497636851;
        Wed, 04 Sep 2024 17:53:56 -0700 (PDT)
Received: from ?IPV6:2605:a601:aa57:7500:2ed2:f96c:ff7d:4041? ([2605:a601:aa57:7500:2ed2:f96c:ff7d:4041])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-277fea0d62bsm1838913fac.4.2024.09.04.17.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 17:53:56 -0700 (PDT)
Message-ID: <df01cdd7-4c01-4ac3-9629-5b226e60dbda@gmail.com>
Date: Wed, 4 Sep 2024 19:53:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wistron CCLA Schedule A update 20240823
To: Claire Ku/WHQ/Wistron <Claire_Ku@wistron.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <ae049cc953614f278f6493ceabd1e208@wistron.com>
 <64d95725ad6abd0966b193cee06c9d7e6f5464f7.camel@fuzziesquirrel.com>
 <TYZPR02MB5691BB7B54CE00AABA6E78F58E779@TYZPR02MB5691.apcprd02.prod.outlook.com>
 <KL1PR02MB47400AC0A88A8331CF0467398E882@KL1PR02MB4740.apcprd02.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <KL1PR02MB47400AC0A88A8331CF0467398E882@KL1PR02MB4740.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Timothy Huang/WHQ/Wistron <Timothy_Huang@wistron.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/23/2024 1:06 AM, Claire Ku/WHQ/Wistron wrote:
> Dear Sir/Madam,
>
> Update the schedule A from Wistron Corporation.
> Please help to review it.
> Thank you very much.

Thanks for keeping it updated. I've uploaded it to the google drive.

Andrew

>
> Your Sincerely,
> Claire
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
