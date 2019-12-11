Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D511A994
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 12:03:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XvDc4hLMzDqn1
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 22:03:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XvCv5KQ9zDqlp
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 22:02:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 03:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
 d="scan'208,217";a="210726061"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by fmsmga008.fm.intel.com with ESMTP; 11 Dec 2019 03:02:45 -0800
Subject: Re: BMC update via TFTP
To: openbmc@lists.ozlabs.org
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <6bce621e-0bd0-9739-dce0-0977b983f513@linux.intel.com>
Date: Wed, 11 Dec 2019 12:02:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------C4F1FE7DAFB8A7C40E399697"
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

This is a multi-part message in MIME format.
--------------C4F1FE7DAFB8A7C40E399697
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

>> Yes, that could be a solution for the problem we discuss, providing 
>> both integrity and confidentiality, without any major OpenBMC 
>> development necessary - but it would mean more operational burden for 
>> BMC admins. The problem with SCP/SFTP in this context is that for 
>> this to work in the same manner as TFTP, the BMC must be an SSH 
>> client - i.e. have some sort of identity/credentials for the SCP/SFTP 
>> server provisioned first. That might not be the easiest solution to 
>> setup, but it's of course possible and can be automated if OpenBMC 
>> provides respective config knobs.
>>
>> Existing ways we have in code-update.md either don't require 
>> credentials (TFTP), so being a client is easy, or are not making a 
>> "client" from BMC, it's the admin who uploads stuff (SCP/REST).
>
> Yes, that's what I was thinking.  (And no, I am not going to recommend 
> setting up a SCP or SFTP server that allows anonymous access.)
>
> This highlight the need for OpenBMC to put together a guide to 
> provisioning your BMC.    Such as guide would give us a place to talk 
> about uploading to the BMC SSH client certificates needed to access 
> and download the firmware images.
>
> - Joseph 

Agree, the provisioning guide could be a good point to have this 
discussion. However I beieve updates in general is a broader and more 
"operational" (i.e. "continuous" as opposed to provisioning being rather 
"one-time") topic, so the approach in the organization/of a given BMC 
admin can change and I believe whatever configuration mechanism we 
develop for this (if at all), should be available at any point during 
BMC lifetime, not only at provisioning, and be architected respectively.


regards,
Alexander



--------------C4F1FE7DAFB8A7C40E399697
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <blockquote type="cite"
      cite="mid:3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com">
      <blockquote type="cite" style="color: #000000;">Yes, that could be
        a solution for the problem we discuss, providing both integrity
        and confidentiality, without any major OpenBMC development
        necessary - but it would mean more operational burden for BMC
        admins. The problem with SCP/SFTP in this context is that for
        this to work in the same manner as TFTP, the BMC must be an SSH
        client - i.e. have some sort of identity/credentials for the
        SCP/SFTP server provisioned first. That might not be the easiest
        solution to setup, but it's of course possible and can be
        automated if OpenBMC provides respective config knobs.
        <br>
        <br>
        Existing ways we have in code-update.md either don't require
        credentials (TFTP), so being a client is easy, or are not making
        a "client" from BMC, it's the admin who uploads stuff
        (SCP/REST).
        <br>
      </blockquote>
      <br>
      Yes, that's what I was thinking.  (And no, I am not going to
      recommend setting up a SCP or SFTP server that allows anonymous
      access.)
      <br>
      <br>
      This highlight the need for OpenBMC to put together a guide to
      provisioning your BMC.    Such as guide would give us a place to
      talk about uploading to the BMC SSH client certificates needed to
      access and download the firmware images.
      <br>
      <br>
      - Joseph
    </blockquote>
    <p>Agree, the provisioning guide could be a good point to have this
      discussion. However I beieve updates in general is a broader and
      more "operational" (i.e. "continuous" as opposed to provisioning
      being rather "one-time") topic, so the approach in the
      organization/of a given BMC admin can change and I believe
      whatever configuration mechanism we develop for this (if at all),
      should be available at any point during BMC lifetime, not only at
      provisioning, and be architected respectively.</p>
    <p><br>
    </p>
    <p>regards,<br>
      Alexander<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------C4F1FE7DAFB8A7C40E399697--
