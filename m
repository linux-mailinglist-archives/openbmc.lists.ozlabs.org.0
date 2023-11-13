Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1907EA572
	for <lists+openbmc@lfdr.de>; Mon, 13 Nov 2023 22:24:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nYFj6G6s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STj9n3YM2z3cfB
	for <lists+openbmc@lfdr.de>; Tue, 14 Nov 2023 08:24:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nYFj6G6s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 14 Nov 2023 08:23:56 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STj982XnLz2ytV
	for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2023 08:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699910638; x=1731446638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pkXu5KE1efmDifUmb74DpjNr5rYi8HFPs7SCH7gFoUQ=;
  b=nYFj6G6s0b2ft652K/QARmKIEAtQd0iSOAB1tgR6la1z665PbJr3sfZP
   VSn1rab2IS7z3a1nWq1/cLvIzrY5LKniPwcEBBoLDkUpRAoIrvoWLcX6h
   ZJUFJE5So9xzogDWQ2dFFkWC6wziwckX1uzBRg79k8LAOu8TloL/RgWQa
   5KA33eXwzrIvXKGU7jFtUNpwX2+iosKH96lp4b/CzNyME3KlGIcbcTJ0K
   SMryqm0vXQ0TF3SkfqBrQ2mOofmLrX+wgLZW1RpwOYB1OpRxU8w5MmISu
   ENkW1q/DXMg5786I7lWZRWDvl0fQYRMLpWQ9h0bCyuVniNNs6EuLwBwfW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3601175"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3601175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 13:22:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5788545"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 13:22:45 -0800
Date: Mon, 13 Nov 2023 13:20:13 -0800
From: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
To: Jerry Wan =?utf-8?B?KOiQrOelkOWYiSk=?= <Jerry.Wan@quantatw.com>
Subject: Re: ipmi: Inquiry Regarding IPMI User Password Testing
Message-ID: <ZVKTDa8MnUDt//Oz@mauery.jf.intel.com>
References: <PUZPR04MB48670ADEFA76685E7FC585EB88AFA@PUZPR04MB4867.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PUZPR04MB48670ADEFA76685E7FC585EB88AFA@PUZPR04MB4867.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, George Hung =?utf-8?B?KOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09-Nov-2023 08:06 AM, Jerry Wan (=E8=90=AC=E7=A5=90=E5=98=89) wrote:
>Hi Vernon,
>
>
>We recently conducted some tests on phosphor-ipmi-host and found that the =
user password test command doesn't appear to be compliant with the IPMI spe=
cification.
>
>We used a 20-byte password testing command to validate a 16-byte password,=
 and it passed the test. However, according to the IPMI specification, I th=
ink the above test combination should return a failure.(Please refer to IPM=
I spec 22.30-Set User Password Command, page 313)
>
>Here is the testing procedure:
>
>  1.  Change the user password with a 16-byte flag.
>root@evb:~# ipmitool user set password 5 Passw0rd 16
>Set User Password command successful (user 5)
>
>  2.
>Use a 16-byte testing command to validate the correct password: Pass
>root@evb:~# ipmitool user test 5 16 Passw0rd
>Success
>
>  3.
>Use a 20-byte testing command to validate the correct password: Pass <=3D=
=3D I think this should be a Fail
>root@gms:~# ipmitool user test 5 20 Passw0rd
>Success
>
>Could you please confirm if my understanding is correct?

Jerry,

The openbmc platform doesn't keep track of how the passwords were set=20
(whether with the 16 or 20 byte flag). So the behavior you showed is=20
expected.

When you set a password, the flag is there just because the IPMI=20
specification had to add it for backwards compatibility with IPMI-1.5.=20
But really, the same underlying code is called with either the 16 or 20=20
byte buffer.

If the password matches, the password matches. The only thing=20
you can't do is attempt to set a 20-byte password and then attempt to=20
authenticate with only the first 16 bytes.

--Vernon
