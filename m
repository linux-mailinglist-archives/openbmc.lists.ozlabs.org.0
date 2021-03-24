Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCB347006
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 04:13:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4tc35YW8z3bM7
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 14:13:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=DWvHY+D3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DWvHY+D3; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4tbW4qYjz3Wtp
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 14:13:08 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso21639963ott.13
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 20:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsR4JBzcL5ta2x96AtmXIJ4B9E/itS6AysTMREaGwNQ=;
 b=DWvHY+D3wDfIUMpkPpGqg1mxSX98QSKue2iuAcdAXDl164OVWFcfNjuI5Ziuwtl2zC
 pV4cFtthGZhaoeJha6BR2RvaAmviItyPM6N2m6dtFe2oPA4NxuTjcp1VWtry8A3HLqyO
 KIWi+0pb9hk1zbsxXHJvnIkj02oZO4ys5eQx5vXTRwxeLp/UacVu6uwDc6IrGzp6/ijf
 d0W6o44eXR05icFVb3Kh5WJgLy4mb3HCAwabiPyJuEphc/1NwVIIl42OltiZaDZqy0j8
 AKSu9N2BWA18e3Ie49PMluIdvJ0vGQ1CjrIx9oPTDJMBXZOklnW6hgfkozHiCED+siuJ
 iUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsR4JBzcL5ta2x96AtmXIJ4B9E/itS6AysTMREaGwNQ=;
 b=XIJ0I6cttacz0zt5JaqmEj8ouKjZ2/MRsFCSUZa3oDWI1mfm1PQ/Zy+adLBzsj96KQ
 rarrMZJp/CdsxYd2/DUWKabIp8x23xocK7dKW77fhzGdglBV3UV5roSj9Cy0UrZXvWuY
 X6afEbcmTChJCMkKho0yYogWCBHQwnym6KpDQrx+2Lds9PoHLBUt5pXF2eBHwj5Boax5
 XtoZlLmwjlHxmTw3xwiLkTAnVPmIyvdNXfgYSWeQjAc7kk82G+6GHRNP1SGDgMZcUaoK
 K9vvze19mN0bNn+zkSxquWBapPYG1rNHyJUOgpO/lkcApls3/nJFE1/nLXN0rPp5iFxO
 c9ng==
X-Gm-Message-State: AOAM533uFOGBqfEsx5pRaKx/lpmHBEtFTYxYXC+LqAAdp7oN3GwtJ2Po
 wxV0H+JbPFMthWKptcFmA3iAwQGs5sdjJx84S7OduQ==
X-Google-Smtp-Source: ABdhPJwulFKDhbSyYeDzzv4XvSvasBURvhtcGLiAowcoJsGBM0TpPHmZ4fDDNSDkhOAFadj57EEyMq9QUT0PeD/vwWc=
X-Received: by 2002:a9d:4e95:: with SMTP id v21mr1179586otk.361.1616555585397; 
 Tue, 23 Mar 2021 20:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
 <411b0a86-799a-3038-ee3a-70007feab0d5@gmail.com>
 <315434fc-94d3-ec8c-b99d-80a88690a119@linux.ibm.com>
In-Reply-To: <315434fc-94d3-ec8c-b99d-80a88690a119@linux.ibm.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 24 Mar 2021 11:12:54 +0800
Message-ID: <CAGm54UEm9JXX555jkR7UQGa8P5kzA+cgsb1fRvUvc1OzANxuBQ@mail.gmail.com>
Subject: Re: UnitTest using the /tmp file system
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Sunitha Harish <sunithaharish04@gmail.com>, deepak.kodihalli.83@gmail.com,
 Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 gmills@us.ibm.com, geissonator@yahoo.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:08 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 3/23/21 12:44 AM, Sunitha Harish wrote:
> > Any views please ?
> >
> > On 21-03-2021 09:30, Sunitha Harish wrote:
> >> Hi,
> >>
> >> This is regarding the unit tests in various repos under openbmc like:
> >> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd,
> >> pldm etc . I have seen the testcases using the /tmp filesystem to
> >> create the directories/files when the UT is run.
>
> Are the files written to the BMC's file system or to the test platform's
> file system?  I don't understand why this is important either way.
> Can't we just erase the file when the unit test is complete?
>

I agree it is better to mock as many interfaces as possible to avoid
accessing host's file system.

But in certain cases, I do want to test the functions that involves filesystem.
In such case, I usually use mkdtemp() to create a temp dir in test
case's ctor or setup(), and remove it on test case's dtor or
tearDown().

-- 
BRs,
Lei YU
