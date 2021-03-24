Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55C3470A3
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 06:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4x7c1Wyfz30Fy
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 16:07:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=shWCLW7z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=shWCLW7z; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4x7N0WfNz301Z
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:07:25 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id f10so6778484pgl.9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 22:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uq0BVv0mq0R1pKC1Hol8/lB85wWUOm2FTWiU2OTOzO8=;
 b=shWCLW7zU/sw+F60ReGpM3JzQAIdwpZm8zIcEWFQuaz5C3cOKulgwlyrkVkLGillgd
 +Z7wdXDR3HWX+jLSpR8sfj+vlWtVNe/DKVb77sHwvn0rDbo0XqamJaUHNNpfkqnchMZa
 p5YfC750xGERWG3D++rI/RZwGWHrW1B2CpYNTNOqZ5TyQu1ZH8ILwUZBcS/9xjqxvQ0Z
 lSPOC0PlD92yFk48bP+d4SA/3yanpf6eghvUQ2vypb4bZYVjq4djAaoYSvF3VP9wLaZe
 ncy5Ww77ndq/lO7HRnFqDTSLFHVAG96ZWzE8cTQchmXuO9ojZOStbJgqyvCm2E4OFVfW
 +5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uq0BVv0mq0R1pKC1Hol8/lB85wWUOm2FTWiU2OTOzO8=;
 b=IlHh7ZfGi54XziW6+g1METjFyYvsJpgz/sjCGdF5x+5Ql68/j+k7LmQmqQjNzzPJyb
 vfOkpwfn/SPlwc3VtHHLtqopZTRZdGHcVxE+b0ilkFiz7K97B+GEjLVHjAnu72NtMiC0
 SvSMURa7vhYiHZfYXPdyqQEuakiMIpO//pjMyaxNir2SrKM7T4Q3PXJnEjigQJNzkoK1
 WYUcuoGLkWjv30A2dtyfaDSQyQXKAWPzAZy/TMMSDfT9rEByw/dCIaq+6cOpU+p1X4L7
 5mvXLCCJYEVlkBCovggaz92FTzHwpq5aSCoopWDH8zv6J0PclGugC1cTj8747Lu1wz5T
 Y++g==
X-Gm-Message-State: AOAM5332lJgX+8l6tWPWD+C1+YfR054JYXRnbA7MMK9kcNfOGZu5F+5+
 n48ipRAN+bRheFBIKPo6oVE=
X-Google-Smtp-Source: ABdhPJyRNgTTjXEiqYSrHl/idO3w0hCVxCx2/Hkh66CjN/cvgyNDNiTRzsXh5lomuxd5RD/2aFCaqA==
X-Received: by 2002:a62:7708:0:b029:1ee:f656:51d5 with SMTP id
 s8-20020a6277080000b02901eef65651d5mr1619091pfc.59.1616562440901; 
 Tue, 23 Mar 2021 22:07:20 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.107.134])
 by smtp.gmail.com with ESMTPSA id m16sm774671pgj.26.2021.03.23.22.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 22:07:20 -0700 (PDT)
Subject: Re: UnitTest using the /tmp file system
To: Lei Yu <yulei.sh@bytedance.com>, Joseph Reynolds <jrey@linux.ibm.com>
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
 <411b0a86-799a-3038-ee3a-70007feab0d5@gmail.com>
 <315434fc-94d3-ec8c-b99d-80a88690a119@linux.ibm.com>
 <CAGm54UEm9JXX555jkR7UQGa8P5kzA+cgsb1fRvUvc1OzANxuBQ@mail.gmail.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <8877bb56-2ba8-5040-e47b-cb54c1cafce2@gmail.com>
Date: Wed, 24 Mar 2021 10:37:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAGm54UEm9JXX555jkR7UQGa8P5kzA+cgsb1fRvUvc1OzANxuBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: openbmc <openbmc@lists.ozlabs.org>, deepak.kodihalli.83@gmail.com,
 Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 gmills@us.ibm.com, geissonator@yahoo.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 24-03-2021 08:42, Lei Yu wrote:
> On Tue, Mar 23, 2021 at 11:08 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>> On 3/23/21 12:44 AM, Sunitha Harish wrote:
>>> Any views please ?
>>>
>>> On 21-03-2021 09:30, Sunitha Harish wrote:
>>>> Hi,
>>>>
>>>> This is regarding the unit tests in various repos under openbmc like:
>>>> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd,
>>>> pldm etc . I have seen the testcases using the /tmp filesystem to
>>>> create the directories/files when the UT is run.
>> Are the files written to the BMC's file system or to the test platform's
>> file system?  I don't understand why this is important either way.
>> Can't we just erase the file when the unit test is complete?
>>
> I agree it is better to mock as many interfaces as possible to avoid
> accessing host's file system.
>
> But in certain cases, I do want to test the functions that involves filesystem.
> In such case, I usually use mkdtemp() to create a temp dir in test
> case's ctor or setup(), and remove it on test case's dtor or
> tearDown().

Yes. The test platform's /tmp directory is used to create the files. The 
implementations in various repos are as Lei mentioned. The files are 
removed when the test is complete.

