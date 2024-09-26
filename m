Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C998799C
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2024 21:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XF3P16qqwz3c9R
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 05:21:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727378482;
	cv=none; b=Ddq2m+GKTiLhkA/Kg2gN3j7ELvVVcmnNG2ieYPLG7hMopYEFM0kWSKT+HcLryowhuhnqR2ehLLSi5VCGzq28jl8t69Cl0Ha+hQsBW6taXM/5QTdIXdInJ6poIAbXh3pAHAtIupLQg3UB40MNs4JzKHD3nsJWHqSvrMvk1W99ySUnL0Zf3EM3MxQyMmH2QGbBkCy6FZEe8KJQUrWH84XYsKRVMGWhYy/8Mhk4y8/+rAijOSd2U0JvXXJ4JoKYkkUZMzWkVLgIgMzU/lYer08TDWbp4H6c3VzFlLpqYK925xeMYBUrEO4464uYfm6za4rRZ8rTj0AN5bP+owS0xKNfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727378482; c=relaxed/relaxed;
	bh=YjTYAwiEcdBvKnyj03DrSn/gFbPOFM9h1SGmRXlp3Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hAJNs4Yy0jy8Wp4huRdT9t9TvgO5/VUpt8No73Mvx2fvzZqeBwxewVjpeEboD6E+tro6g032d95xi/glys4xY2sopzoSZLvbvUzZCl6mcgU4fcdd4DQteLjygWMNoKCiEKQO+QtnCzdEIbm1+5MvoK8kVrZNLLGSl/ZQU93m9TIgE2d7N3dt83bM+QlRN4pe0pPQ9I3mZXfy2XMmYtcxXRV2yNyAzDP3jD9bhjwqyMQYhjtyw+q6PcbOiw6COiCNnU7EKhLLp1AId6BXwVApamUQy3QyIkH3IHMpWZlC06hyu08DQRf61/3X5hBtIjnXxSfnq02Q4YUdNQmBSL05Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bux3WfeW; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bux3WfeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XF3Nx2Ptyz2yYk
	for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2024 05:21:19 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2870bd5e1f7so256699fac.3
        for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727378471; x=1727983271; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjTYAwiEcdBvKnyj03DrSn/gFbPOFM9h1SGmRXlp3Yg=;
        b=Bux3WfeWdOncmDY6MYQs4v3gRbRkAavWAggR66FCuEoY0F+mERbrqv8vBgbaGMyQ1Z
         0DqbQZL6FKSR78eBcUVhfsIYfB/kBZziq6xh8B3u0ZqalV6zFosQizGiGA+qHZnbq5Ul
         A7HiuClAZMA7V1qCf45FAZomCAk2VPFr8DnPzo3Pg/AE6u9rvTpSrDO3ug8o3N71+NmT
         6PxkLD0D4HD+aoj3cQr7Yg9PNSetKvp1JCT1tAFz1VTLpaJK2ICrrqZ1AfUeptRQvlGT
         SlxkxDnsGCEd2OonPL55IV/NcPNOR9vTtzBssSbewyVpbBiJRPwnjGKvxpa7sRNWH0hG
         r1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727378471; x=1727983271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjTYAwiEcdBvKnyj03DrSn/gFbPOFM9h1SGmRXlp3Yg=;
        b=eJYiTv9dlJNdRQEtz7noBNOpn0WKMrX9MB126AnAcDRnNfcBLUUHq+dhfTCCZVG5wJ
         D2KDlJFakPqxzMmBTDsAGgFG1ihgjKRoeuKOCEcCytNku2o1fkpV9qCjfnZeRK71LyMH
         HoP49KYuZMROh4/cdpWCrZ05C88Me4lfnjYzYvoRKjc4srOpgxrYUvALYVI3bmde4OpP
         NYDqzylni4p4mlUMjwESWDW/qp/m9SlYqX/Ck+QGOfsLhkFeokNYL6hClq+3Km985AIH
         6uwxFysOfE+YKynbHJSH7qvPV6DMJ/QbAIqxchhY/rM3bW7wbwns4ehMqSJkUtPJZ3oR
         lUCA==
X-Forwarded-Encrypted: i=1; AJvYcCVNt/b5SPTukPUUTWDtqdqdYZoXME2Qpb2Icrx+p0Sw/fBYjwU/XR0Dxiu/MBITvJa1oWQ9VLaN@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMck01h1iYqXSOHCscYb682pN0uyqOHAxU9cKiPDnKbQSB7Xja
	m7vkup5e7Izd6cVOhSKuPf2HxzVl80EUVz0F23h7enarpdO9cc3H
X-Google-Smtp-Source: AGHT+IHmaG62gfpdrZb7ZnuxFJJaj7R0NCV+7sYy7by/DYunRBYBWIc8vlkVZJKFibscON1FjIy1YA==
X-Received: by 2002:a05:6870:3044:b0:27b:55e1:71e2 with SMTP id 586e51a60fabf-28710ab1b40mr1043799fac.23.1727378471436;
        Thu, 26 Sep 2024 12:21:11 -0700 (PDT)
Received: from ?IPV6:2601:184:200:8480:7c49:b969:e80:96ed? ([2601:184:200:8480:7c49:b969:e80:96ed])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782a22fsm17740585a.83.2024.09.26.12.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 12:21:09 -0700 (PDT)
Message-ID: <4ba221ea-5c27-4547-b89c-95ba03451b31@gmail.com>
Date: Thu, 26 Sep 2024 15:21:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CCLA for MiTAC_Tyan needs to be updated
To: hancock.chang@mic.com.tw, openbmc@lists.ozlabs.org
References: <9b6b8fbff7924cb6a505f028f68e51b3@mic.com.tw>
 <3a962617-2447-447a-bedb-f9911757558f@gmail.com>
 <8b676646c5b644dcb1b5125ab5a3e931@mic.com.tw>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <8b676646c5b644dcb1b5125ab5a3e931@mic.com.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 9/23/2024 11:46 PM, hancock.chang@mic.com.tw wrote:
> Hi Andrew
>
> The attached is the update info of CLA manager and member list of CCLA schedule A for MiTAC team, could you or someone approve and grant me (my google account is : hancock0512@gmail.com ) the access of google drive (https://drive.google.com/drive/folders/1vKCSGGXlUbEZgAxnC54pSMklSh_xTzRc ) that I can upload it to correspond MiTAC's original CCLA by ourselves?

Hi Hancock,

I've uploaded your updated schedule A and added your google account to 
the folder.

You should have permission to add people from the CLA to the gerrit 
group up at 
https://gerrit.openbmc.org/admin/groups/455eac2e296f52e64fd498685e1636513a7cb825,members

You can only add people once they've logged into gerrit at least once.

The commit to add MiTAC to an approved CI group is up at 
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/74907

Andrew

>
> Thank you
>
>
> Hancock
>
> -----Original Message-----
> From: hancock.chang (張育誠 - MCT)
> Sent: Monday, August 19, 2024 4:09 PM
> To: 'Andrew Geissler' <geissonator@gmail.com>; openbmc@lists.ozlabs.org
> Cc: eric_kuo (郭守堅 - MCT) <eric_kuo@mic.com.tw>
> Subject: RE: CCLA for MiTAC_Tyan needs to be updated
>
> Hi Andrew
>
> Thank you so much. We have checked the original CCLA hardcopy you helped to find out, it was signed with "MiTAC Computing Technology", so to MiTAC, it is no concern to keep this CCLA from legal perspective since we will keep "MiTAC" as our only brand name later from this year.
>
> Just checked the CLA manager name list which would need to be updated, per the process and rule, I remember the CLA manager list is allowed to be updated by ourselves and upload to google drive directly, so if I am correct, we will update the CLA manager name list then may ask for your help for adding people to the gerrit CI group (for CI approval)
>
> Thank you
>
>
> Hancock
>
> -----Original Message-----
> From: Andrew Geissler <geissonator@gmail.com>
> Sent: Tuesday, August 13, 2024 11:21 PM
> To: hancock.chang (張育誠 - MCT) <hancock.chang@mic.com.tw>; openbmc@lists.ozlabs.org
> Cc: eric_kuo (郭守堅 - MCT) <eric_kuo@mic.com.tw>
> Subject: Re: CCLA for MiTAC_Tyan needs to be updated
>
>
>     This email originated from outside of MiTAC group. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On 8/1/2024 12:26 AM, hancock.chang@mic.com.tw wrote:
>> Dear OpenBMC org,
>>
>> Tyan, the branded business group of MiTAC Computing Technology, has
>> signed CCLA of OpenBMC in several years ago, since lots of member
>> change in these year, also the organization change with brand name
>> change, we will unify our brand to combine “Tyan” and “MiTAC” then
>> just keep “MiTAC” as our single brand from 2024 Q3; assume it might
>> need to re-new the original CCLA between Tyan and Linux Foundation for
>> OpenBMC, should we re-submit a new CCLA?
>>
> Hi, welcome back. I don't see a CLA for Tyan in our google drive. I do see one for MiTAC
>
> up at
> https://drive.google.com/drive/folders/1vKCSGGXlUbEZgAxnC54pSMklSh_xTzRc
>
> If you can  just submit one CLA for both Tyan and MiTAC then that would be simplest.
>
> You can send to the mailing list and I'll review and update it in our google drive.
>
> Thanks,
>
> Andrew
>
>> BTW, may we have help from OpenBMC org, to check and get the original
>> CCLA between Tyan and Linux Foundation?
>>
>> Thank you
>>
>> Hancock Chang
>>
>> Director, Solution Enabling Dept., BEOC
>>
>> MiTAC Computing Technology
>>
>> Tel: +8863-327-5988 #7359
>>
>> Cell: +886935547665
>>
