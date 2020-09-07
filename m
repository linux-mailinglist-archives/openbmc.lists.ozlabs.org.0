Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D1425F60D
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 11:11:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlMvs4dBqzDqNd
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 19:11:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=QUBhxQao; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlMtk649VzDqLV
 for <openbmc@lists.ozlabs.org>; Mon,  7 Sep 2020 19:10:05 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4983F56264;
 Mon,  7 Sep 2020 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599469798; x=1601284199; bh=S99b51mFrY2Yp/j0diBSH+fSs
 ZE/D5SVGuFbc9Av674=; b=QUBhxQaopOy23KqOgHk15f3cMOEUwjAi4elGH55dL
 54TGCWGIo1jYWsIy3IXmKnN/YSjmxrJ3uYQXmewr66YT2dbbZHLgjnDtXk/0MIP4
 cZNKd2rrMtFhmI+dXWlqAcHBrk0b99ltVo7BasuFwPKHhRCXKi5CNhno0tj42J4P
 +A=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcWqKpbg4F0p; Mon,  7 Sep 2020 12:09:58 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3346D51750;
 Mon,  7 Sep 2020 12:09:57 +0300 (MSK)
Received: from [10.199.2.182] (10.199.2.182) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 7 Sep
 2020 12:09:57 +0300
Message-ID: <25227b1489c3717db3b19b60e1ee03d045cba0ce.camel@yadro.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Ed Tanous <ed@tanous.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 7 Sep 2020 12:09:56 +0300
In-Reply-To: <CACWQX83+BO7WuZBW6ubJwvYOhKee=F0Hf5WBWm2uX2bhBV3ZMA@mail.gmail.com>
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
 <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
 <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
 <CACWQX83+BO7WuZBW6ubJwvYOhKee=F0Hf5WBWm2uX2bhBV3ZMA@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.182]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

	
> I just looked, and there's 2 platforms that have a bridgeGpio
> definition, and Wolf Pass for sure has it on the schematic, not sure
> about FBTP.  Which platform were you looking at that didn't have it?
> ADCs have a very high parasitic drain on the cmos battery, to the
> point where it affects their longevity.  This is an implementation of
> a FET that explicitly enables the circuit when the battery is being
> read.  Most modern Aspeed platforms should have this circuit.
> 

Strange, then I probably have wrong schematics for Wolf Pass, since I
can't find any gates for P3V_BAT line.

Saying "all other configs" I meant those from meta-openbmc-mods repo:

$ grep -r "BridgeGpio" entity-manager 
entity-manager/configurations/FBTP.json:            "BridgeGpio": [
entity-manager/configurations/WFT Baseboard.json:            "BridgeGpio": [
entity-manager/schemas/legacy.json:                "BridgeGpio": {
entity-manager/schemas/legacy.json:                    "$ref": "#/definitions/Types/BridgeGpio"
entity-manager/schemas/legacy.json:            "BridgeGpio": {
entity-manager/oe-local-files/WC-Baseboard.json:            "BridgeGpio": [
entity-manager/oe-local-files/WP-Baseboard.json:            "BridgeGpio": [
entity-manager/oe-local-files/TNP-baseboard.json:            "BridgeGpio": [
entity-manager/oe-local-files/CYP-baseboard.json:            "BridgeGpio": [
entity-manager/oe-local-files/CPC-Baseboard.json:            "BridgeGpio": [


