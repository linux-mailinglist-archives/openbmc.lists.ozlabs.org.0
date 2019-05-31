Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B407313D7
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 19:30:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fs0H0dX9zDqX3
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 03:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6BcWYrH"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Frzs1FY0zDqWY
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 03:29:45 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id l17so9993767otq.1
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=niIgwTRavyKpjZq0d+vju6eW1w3y9NldGaBx9Li4EEc=;
 b=b6BcWYrH8L4foeaZ9Gd+SOnapWgn3QIQatTQGIqfX7KWJ2gpBTdmm1vATVCOQGeOtv
 rEW9dLe92yQnYEcyc2uaQk+vIA/UaHlPSSw/RnKrlw9jmEwzXmr3Na+x7ASkqfjR6IbJ
 xxyLdaWsCLSSaVRDv8C4J5JNJIL5Usds1OF++XcuYUPR+7S4+y7UCKnNjLubvMtG7oPa
 H2IDOlGnAUtBD9J4qUPpMuUqwUEuWUVOcpYdQq6XXscozUfi06a8G1ZY1aSNDm93NUp2
 CQV5TU8br2QH4HLt2Bpn1hqeXufQs3i3SglYRe8y8swTd5Tz0z+IpS7Vz1UoHJNygasx
 p8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=niIgwTRavyKpjZq0d+vju6eW1w3y9NldGaBx9Li4EEc=;
 b=Vlchsc5rZLJodHgcnnm3cRbxUYrlGENcmi0MWrY52qqgEl/DvC64VIjJKh52aywjgZ
 0UmuQW9KYigmEEQT/vw4ZHrZmPuVU7HXRAuCxJ3oUketRiKhh9opjppk9wyoSmxdaAEG
 N7j65Bd8Bv8uW2yObeC9lXSNd+GBn5Dk9MXZf1rCSlDmfTGQ6ZRpaTwXgFCNwsOktVqN
 tcf5xmWbpSa/JTPiAluEtEPBffRbEnHeTgsCCvy6hR2gOsGJxeXfxtIqPxJ/BeC+V6Hg
 aYi1kn5RDwnHMtqUdBFsgW00ZrlHFav/3J5s5KDEOP0GTbUj56ZE92Xh9TR03N8wlYyO
 vsKg==
X-Gm-Message-State: APjAAAUGDODtzG1f/m/gYibOM1vbf5NAHTdGKXFx34iJcDVS9UyOZUYt
 HvPGX01urqKJ7FcaK0JlAJlImt00
X-Google-Smtp-Source: APXvYqw8JAfN8V9dGqVId56Niku9dYCB5yxC+ExFbnLDqljmlu2ZfM2ru1TPk9v72iQeBp0pIaD1ug==
X-Received: by 2002:a9d:6743:: with SMTP id w3mr2848073otm.198.1559323781306; 
 Fri, 31 May 2019 10:29:41 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id k99sm2306793otk.12.2019.05.31.10.29.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 10:29:40 -0700 (PDT)
Subject: Re: Fw: OpenBMC Test Work group meeting: MoM of 30 May 2019 instance
To: Sivas Srr <sivas.srr@in.ibm.com>, openbmc@lists.ozlabs.org
References: <OF94CB576A.2BCD1094-ON0025840B.005284C4-0025840B.0053E0BA@notes.na.collabserv.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <87bcb494-7de7-b229-2db6-a2884586c8f2@gmail.com>
Date: Fri, 31 May 2019 12:29:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <OF94CB576A.2BCD1094-ON0025840B.005284C4-0025840B.0053E0BA@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 5/31/19 10:16 AM, Sivas Srr wrote:
> Dear All,
> Here with sending MoM of last instance of test work group meeting.
> Attendees: Joseph Reynold, Rahul Maheswari and Sivas:
> Agenda:
> a) Security WG update and security testing: Joseph Reynolds:
> Joseph walked thru security workgroup wiki
> https://github.com/openbmc/openbmc/wiki/Security-working-group
> Sivas to check with community and our test team to help on testing.
> b) Update on test specification document by Sivas
> https://github.com/openbmc/openbmc-test-automation/issues/1769
> Working on converting word document into md format.
> c) Update on test in progress in work in progress wiki
> https://github.com/openbmc/openbmc/wiki/Work-in-progress
> and function test which is done is updated in changelog wiki
> https://github.com/openbmc/openbmc/wiki/Changelog
> d)  Need help on when the code changes will be available for issue
> https://github.com/openbmc/bmcweb/issues/62 - Thank you Rahul for 
> bringing it in.
> Kurt, Could you pls help here in case if you have target date. Thank you 
> in advance.

I am not working on this issue. Please ask the developer(s) on IRC. They 
may not be aware you need a status update as it was purely chance that I 
happened to read this question embedded in the Test WG minutes.

Since it touches Redfish, IPMI and User management, it might be a good 
thing to bring up in a separate email, or even a design discussion.

Kurt Taylor (krtaylor)


> Those who are contributing to test so far, Thank you team for all your 
> contribution.
> Need more contribution from other community as well.
> Google Drive MoM video link: 
> https://drive.google.com/open?id=1lVXp-0XWd8YZe5Xspi6qZD2XbxchZhcB
> All other MoM folder: 
> https://drive.google.com/drive/folders/1Cps88uPHB87RkQY3uDFKdVwrTmFQBtYa
> With regards,
> Sivas
> 
>     ----- Original message -----
> 
> 
>         OpenBMC Test Work group meeting: - Webex link:
>         https://ibm.webex.com/meet/sivas.srr Telephone access is: United
>         States Toll Free 1-844-531-0958 (Toll - +1-669-234-1178) India
>         Toll - 0(STD Code)-64800002 For eg. (Bengaluru - 080-64800002)
> 
>     Chair: Sivas Srr/India/IBM
>     Delegated to:
>     Send by:
>     Comments from Sivas Srr:
>     Time: Thu, May 30, 2019 9:00 PM - 10:00 PM (applies to 18 instances)
>     Location: United States Toll Free 1-844-531-0958 (Toll -
>     +1-669-234-1178) India Toll - 0(STD Code)-64800002 For eg.
>     (Bengaluru - 080-64800002) Passcode: 928 662 307
>     Room:
>     Resource:
>     Online Meeting name: OpenBMC Test Group meeting
>     Online meeting: https://ibm.webex.com/meet/sivas.srr
>     Meeting ID: 928 662 307
>     Password: sivas
>     Required:
>     Andrew Geissler/Austin/IBM, anup.pandya@intel.com, Arpana M
>     Durgaprasad/India/IBM, benjaminfair@google.com,
>     bradleyb@fuzziesquirrel.com, Deepak Kodihalli/India/IBM,
>     ed.tanous@intel.com, George Keishing/India/IBM, Joseph
>     Reynolds/Rochester/Contr/IBM, Kaushik Venkatesh/India/IBM,
>     kurt.r.taylor@gmail.com, Maury Zipse/Rochester/IBM, Michael
>     Walsh/Rochester/IBM, rahulmaheshwari01@gmail.com, Ravindra S
>     Rao1/India/IBM, yuenn@google.com
>     Optional:
>     FYI:
>     Description:
>     Based on the last instance of meeting, it is agreed to have meeting
>     from Jan 10th on-wards.
>     General Agenda:
>     Feel free to update in case any of you wants to update the agenda.
>     https://github.com/openbmc/openbmc/wiki/Test-work-group
>     <https://github.com/openbmc/openbmc/wiki/Test-work-group>
>     Dreport instead of MYFFDC
>     https://github.com/openbmc/openbmc-test-automation/issues/1118
>     https://github.com/openbmc/openbmc-test-automation/issues/1091
> 
>     OpenBMC Feature Test Sign-on
>     https://drive.google.com/file/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=sharing
> 
>     OpenBMC test cases in XL sheet: OpenBMC test cases in XL sheet
>     <https://docs.google.com/spreadsheets/d/14UFFokv6kifk_2leUU_77yOFSNkv7sCE_KEAhaYXkyg/edit?usp=sharing>
>     Updated Version:
>     https://docs.google.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvnRVM8_-ll-WCvdxm5NR6Y/edit?usp=sharing
> 
>     Quality at the first place: Unit test results needed at the time of
>     gerrit code review
>     IPMI Inband code update -  Nancy to come back on test owner
>     IPMI User management -  Anup Pandya - Is any one from Intel going to
>     sign on this. ?
> 
> 

