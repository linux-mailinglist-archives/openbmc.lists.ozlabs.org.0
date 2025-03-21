Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74380A6C1DF
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 18:51:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK93T4Sb7z3cF6
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 04:51:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742579457;
	cv=none; b=glRH8G5MsCLeRPkagkJ/PGikOpB94KdRQrsn5QjLleAWBtQydQ2rVAaAv/gXKy0fxMOWoI7/maV4f+xvxxj5UvJ1Qy6awpOIGp7rJdGJS/dMsty8ll0B9dCkqA9QqcDuBSp3cF1f1JWJUUUfFu4W4XQrlN1MWpoKJnwDCkc2dDUesirF9gsGbQ0w8bDLwynqVkP1aYMvSZh61uFN24hwBj1tgwSpXci+ZJni/VPk13eClICp8f1KddR4Xc2vTEG0lKnsVXHxxAK15wD9xF1wtPfRymJuosEgkpNeWf26nS27jx9x1IsPJLEwz/bfFaoJCvvy4pkyYIHa1GVxGL0I3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742579457; c=relaxed/relaxed;
	bh=AFjeRY/PQLEtJ06ydxn1Not6ohDJ4/7ad6vW1AtEGF8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RzHo+LhExVQdQmVmskx8S5U1HmdgQAgjYTdc/s22mL/ruf2Ni+nOgQa285urQHagEX5lDzauMFQlPSoGjly4QCR+NXXVvIvucn7W+ecgYiQnc8pXSB56XiqO9Scye/l2+NDTBAo6/gzParrYkSVqcokevb6JgOXW3T2vIm8/YvGbM7GfMe3u0KnCVfuFC483NyIAOqfC3+82JWKv5ivcSLqAOF7fGBfxwt3dxCjXVSv6oVtAu4fOon28vrWzHtpKJ+aDVfWjButCb+r/Dr39sqlnuP6ujM01n8++++w30zbbwEp/Z7RklEK5u/BZUItL6ZFupFsRHuAEiPWY7WBAfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NoRlwaOx; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NoRlwaOx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK93N73lQz30PF
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 04:50:56 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2870A82872E4;
	Fri, 21 Mar 2025 12:50:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZcusIcMStyns; Fri, 21 Mar 2025 12:50:54 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4B03A8287655;
	Fri, 21 Mar 2025 12:50:54 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4B03A8287655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742579454; bh=AFjeRY/PQLEtJ06ydxn1Not6ohDJ4/7ad6vW1AtEGF8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=NoRlwaOxECOX/YNzXpfwn+/IeAFvC5tQ4lThsbFbpfdO+WaLh3MHjFHD4U7F4Dzzl
	 blHsITMMZ3wPc55zscqdpVsL59HUSuD/Dp/X6ksEracVTmcOSQH2ee479X9WReoHWj
	 eOI84gsW22h3LkGRoATWjXWTycFoj0MoX5g/Oo40=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gUhn3DXz8z5j; Fri, 21 Mar 2025 12:50:54 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2018982872E4;
	Fri, 21 Mar 2025 12:50:54 -0500 (CDT)
Date: Fri, 21 Mar 2025 12:50:51 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Paul Fertser <fercerpav@gmail.com>
Message-ID: <1222768696.19599951.1742579451325.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <Z92lMNqRcWrdmMrS@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com> <Z92lMNqRcWrdmMrS@home.paul.comp>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Topic: marvell: Allow targets to skip MII RX/TX errata
Thread-Index: 0NlmV7lAEkRN5xaaGAMcXsvZy5SSLg==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Paul Fertser" <fercerpav@gmail.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Friday, March 21, 2025 12:43:12 PM
> Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX errata

> On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
>>  application
> 
> A rather uninformative commit message again.
> 
>> Upstream-Status: Pending
> 
> Pending what exactly and why? I guess you're supposed to send your
> series upstream (to Linux devs) first, then after they're accepted you
> can ask for backporting them to OpenBMC tree. There're exceptions but
> you need to provide a rather convincing reason for that I guess. I'm
> not saying that in any official capacity, just as a sidenote, Joel
> will clarify if I'm wrong.
> 
>> +if PHY_MARVELL
>> +
>> +config PHY_MARVELL_APPLY_MII_RXTX_ERRATA
>> +	bool
>> +	default n
>> +
>> +endif # PHY_MARVELL
> 
> This doesn't seem to be the right approach at all. If it needs to be
> specified per board, you need to add it to Device Tree schema and
> those Device Tree board files that are affected.
> 
>> +		/* Per the vendor, certain Marvell devices will not function if
>> +		 * the RGMII TX/RX delay registers are modified.  If an
>> +		 * affected design has been selected, do not write the
>> +		 * RX/TX delay registers.
>> +		 */
> 
> This doesn't say much. Please reference the actual errata document
> number or cite its text or find some other way to explain which
> devices are affected how. Proper implementation depends a lot on those
> details.

Understood.  I am navigating a bit of a sea of NDA restricted / proprietary components here, apologies for the lack of detail.

Let me see if I can get that information and get approval for public disclosure.  These patches are in support of the SIE Cronos board, which unfortunately was designed by a third party without proper U-boot / OpenBMC integration in mind.  As a result, there are unique hardware decisions that were made, and the DT is not authoritative on these platforms.
