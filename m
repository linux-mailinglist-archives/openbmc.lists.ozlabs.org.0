Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804CD34C2B5
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 06:30:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F803z3GB0z301j
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 15:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lc4T8wyH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lc4T8wyH; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F803g4GwQz2yYx
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 15:29:49 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id s11so3001368pfm.1
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 21:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=83GQB+yJ4dWbMyFZQjOXpryGD9fdgLLsVy2oAnDFoos=;
 b=lc4T8wyHHgAWzawwIv5rDd6TBt9MRBLfAESO46+xu3KcJTaT33ydx21sSe+auc7xwX
 lOexU0ngXDahA1caXxvhaaurfKbyCggYOB1Jyyz/dHq+sHui5expCrzqY3hQFbcxrIK8
 M4I13nL2Ti2cRdAsP3Kj/l6BK1d7wZLlwoZ0ij36o+ReSR8gqMnSIIx9NYKO7VrjfFgM
 ulXd/GRLOH4N6zTlEG2gbDnpMnOOffT0Vm4DFDQksJOZgI62+DbDhIyRbxldW6BM+8Hg
 UHdYYeHHrH/WHnF1N0hyHIimPsCoxZWUlfbVakGBHz90hdlxvC2Urygvr7vZet3u9h1H
 cHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=83GQB+yJ4dWbMyFZQjOXpryGD9fdgLLsVy2oAnDFoos=;
 b=YAplxdpBinAIRAw8EgmwXDnOWTsYnD+Y6pHFPLa4spDEzXNwv7Ukj0Zf8CXPEsuc17
 5KnBrhvQ7GLfeoEcjbxKM3vCy+DPxVDdxumpLEOVTSLpDjpzD6YXkj+mAYeX7VYNTfAk
 oC5nh5Qi/AoQtKVwgAVgm2sF8lC/00xmdL1+nSSt3sc9vnFntvKVouAjpj7cxADUYWJa
 v2Kzk5TGcp3atm76qkwPD0WUZCZDYYnpk89Fpk86uJ8RdyT9WpgccmjQUp26pv3XdqiV
 PzF5p0t+UxSJpugkQ33vRM8YBrk/3pGz/zNkhDM8uRByOEWXOiIwLsQ87qC8jAma4crq
 FhbQ==
X-Gm-Message-State: AOAM532S56CsVnMM4WHbKsU/UDKNwDKHQ+RRokGgny/LQMUYh1HZaQPx
 vF4bk3zTjQDLhELfn/ue/+k=
X-Google-Smtp-Source: ABdhPJy29grlSguV/ihEM4jsU9pZ8M45+v5sxfcaGz7BnMdPR1O0N6Rq63+nWDs2HyVjrXi+RHYZpg==
X-Received: by 2002:a63:c807:: with SMTP id z7mr21928496pgg.363.1616992184052; 
 Sun, 28 Mar 2021 21:29:44 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.105.77])
 by smtp.gmail.com with ESMTPSA id ha8sm13822315pjb.6.2021.03.28.21.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 21:29:43 -0700 (PDT)
Subject: Re: UnitTest using the /tmp file system
To: Patrick Williams <patrick@stwcx.xyz>
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
 <YF87S2Y9texS/ac0@heinlein>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <9902c7ca-7c62-53e6-2ba9-1bc540da852e@gmail.com>
Date: Mon, 29 Mar 2021 09:59:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YF87S2Y9texS/ac0@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, deepak.kodihalli.83@gmail.com,
 edtanous@google.com, bradleyb@fuzziesquirrel.com, gmills@us.ibm.com,
 geissonator@yahoo.com, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27-03-2021 19:33, Patrick Williams wrote:
> On Sun, Mar 21, 2021 at 09:30:30AM +0530, Sunitha Harish wrote:
>
>> This is regarding the unit tests in various repos under openbmc like:
>> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd, pldm
>> etc . I have seen the testcases using the /tmp filesystem to create the
>> directories/files when the UT is run.
>>
>> I followed the similar way of writing the UT in one of my commits
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37352 .  As per
>> the review comments in this commit, using the /tmp file system for UT is
>> anti-pattern, and this needs to be changed by mocking the same. I agree
>> that this is a valid thing to do.
> With respect to this being an "anti-pattern", I'm not sure where this
> statement is coming from.  Generally we have very few statements on how
> unit-testing should be done across the project and this is certainly not
> an "anti-pattern" documented in our usual place[1].
>
> In terms of "what is appropriate to do in a unit test", I see two
> possible perspectives:
>      1. Anything is permissible and appropriate to do in a unit test (and
>         thus nothing is *required* to be mocked).
>      2. No system calls may be called from the unit test (and thus all
>         system calls are required to be mocked).
>
> Anything other than these two possibilities seems, to me, relatively
> arbitrary without specific evidence that the un-mocked code is
> problematic.  Nobody actually follows #2 because if you did you'd need
> to mock even the 'sbrk' call which is used to create your heap.  So, the
> question is why is one set of system calls reasonable to use in a
> unit-test and another not?
>
> We have many unit tests across the project that interact with either
> the file system or dbus.  Whoever wrote them probably decided that was
> the most pragmatic way to test their code and gain the coverage they
> were looking for and whoever maintained the repository accepted that as
> a solution.  In this case, I would encourage you to dig deeper into the
> maintainer's opinion as to why this is an inappropriate approach for
> this particular repository or unit-test.
>
> There is one specific problem area we have encountered with fs-using UTs
> and it is aggravated by the fact that we run tests in parallel and
> sometimes Jenkins jobs land on the same machine: any files you create in
> the file system, or dbus services you create, should use some sort of
> randomness to avoid collisions between separate UTs.  I see in your
> original commit, before the UTs were removed, that you used 'mkdtemp'
> with an XXXXXX pattern which should resolve this potential issue.
>
> 1. https://github.com/openbmc/docs/blob/0f6c884822ca2d101e2a0bf3256ecf4f6f2431a3/anti-patterns.md
Thank you Patrick for the detailed view on this. Other repos using the 
/tmp for unit-test can be justified with this.

@Ed/Gunnar - can you please share your views as well? Currently bmcweb 
does not have the unit-test for methods which use dbus calls & which 
takes files as argument/return object. We may need some temporary test 
file in the unit-test setup. What will be the plan for bmcweb to handle 
these cases?

Thanks & regards,
Sunitha
