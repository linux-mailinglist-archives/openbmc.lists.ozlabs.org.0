Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9ACA6C20B
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 19:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK9L44TNMz3cDS
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 05:03:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742580216;
	cv=none; b=D/exPBwrdiojmZMTKlNRInC0fH5syPiZxPViVJ2jeH6r+vN/7Jyg98293XO9C5jSJak/l5LjHcM6zD9bltt5hfaRJSmxrVgge2j0NObuy1jtiEOUlE6b7LyiBGTfRbyxCCfPj+85+gABd2ep0QnzF91Wa0Gibe6WQA3CFjcFG3hx1VqonjRN5an41gVcxoB7VfLiLtha3BchEP3vWGXJG5cnS4FYix12ONQ571r5xUqeAzJBUFTrYda361BUOWyMD66QXaN6AoVmnGFL4v8+XxHsyBHQEaaIGTkehrCWbw3cTI42RJFS06/NQ6rBlwO22jtQ0rLp8Jbx1+kkM7mNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742580216; c=relaxed/relaxed;
	bh=4GoPADwISiJVQfoNeub9J9mL3fqNCUo03s+8T8fZHvU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=C98ZnOY5+oTIf14BJIfcrfRVijeoDCvfiSQAod4EO+wLVK0flRwfTJZMu/Ag+6VP6aT04Or9+ZdDi7iJEY8vuPAD0o16RtVv9NHfFaPTb8BsmqFD9CSjQQeuWliCXB6AOZVe2HCsoly2jkgYAr+H2hQj0SuSDAodHSdp2GRVQMYduf85HEupf6qoH/N/m+98PVLKsyTIzd6/0DqeBo4DFZ5YhWJFpIKEYY0aDdpv/nYd3uNAMxUa/AhTEcRyDbgciokoWpIrflBDQElkTTi0hCH6wj+mXP2DsRtEQKBZUqUm4DCYOY2lso3gp9WvL+FPfAdIfifLS6VrtO78o9NL7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=cb8ClNP9; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=cb8ClNP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK9Kz1R2Zz30MM
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 05:03:34 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3364C82855B6;
	Fri, 21 Mar 2025 13:03:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8wD9FzQphMGC; Fri, 21 Mar 2025 13:03:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8EB4D8285675;
	Fri, 21 Mar 2025 13:03:32 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8EB4D8285675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742580212; bh=4GoPADwISiJVQfoNeub9J9mL3fqNCUo03s+8T8fZHvU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=cb8ClNP95utq8BKGo1giBzw5mCNVA4te0cVq9opwYKLd/9FRaLBmuVUdg4HoBq2FG
	 pGWK4AADIFDghz40ZOoSYhNeBtIDcPeG2nLSEH0oCO3RNtPE5XnpY60ewuP7Ccv8CF
	 qCQ9cP9Pkb/rPk9e+tC0jDgD9DDpKE39exkQGOeA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l_hDz8lB6HmD; Fri, 21 Mar 2025 13:03:32 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 62B5082855B6;
	Fri, 21 Mar 2025 13:03:32 -0500 (CDT)
Date: Fri, 21 Mar 2025 13:03:29 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Paul Fertser <fercerpav@gmail.com>
Message-ID: <598187779.19601308.1742580209857.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <Z92po2d3F4bkYsJH@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com> <Z92lMNqRcWrdmMrS@home.paul.comp> <1222768696.19599951.1742579451325.JavaMail.zimbra@raptorengineeringinc.com> <Z92po2d3F4bkYsJH@home.paul.comp>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Topic: marvell: Allow targets to skip MII RX/TX errata
Thread-Index: /VYWeHAU3Xhl4U+6Fbkp85WZ5cxQBg==
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
> Sent: Friday, March 21, 2025 1:02:11 PM
> Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX errata

> On Fri, Mar 21, 2025 at 12:50:51PM -0500, Timothy Pearson wrote:
>> >> +		/* Per the vendor, certain Marvell devices will not function if
>> >> +		 * the RGMII TX/RX delay registers are modified.  If an
>> >> +		 * affected design has been selected, do not write the
>> >> +		 * RX/TX delay registers.
>> >> +		 */
>> > 
>> > This doesn't say much. Please reference the actual errata document
>> > number or cite its text or find some other way to explain which
>> > devices are affected how. Proper implementation depends a lot on those
>> > details.
>> 
>> Understood.  I am navigating a bit of a sea of NDA restricted / proprietary
>> components here, apologies for the lack of detail.
>> 
>> Let me see if I can get that information and get approval for public
>> disclosure.  These patches are in support of the SIE Cronos board,
>> which unfortunately was designed by a third party without proper
>> U-boot / OpenBMC integration in mind.  As a result, there are unique
>> hardware decisions that were made, and the DT is not authoritative
>> on these platforms.
> 
> DT should be capable of describing any hardware, that's what it's made
> for. If some particular property is missing it can be added upstream
> and then added to the board's DT. It's not yet clear from this patch
> and its commit message what specifically is unique about this board.

Understood.  I will attempt to get authorization to describe publicly in more detail.
