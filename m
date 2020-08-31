Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40D257FF8
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 19:55:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgHss26qNzDqRy
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 03:55:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=doeP+g22; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgHrx5tRYzDqR2
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 03:54:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B5E00574E8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1598896459; x=1600710860; bh=LlEUtXBBr0YCbg8QxM822ynT9cubEWoB
 pZMgxsHPf3s=; b=doeP+g22Ubm0pQx8U80CHIyXyWc+6yg2X7HolsaQuLCftQJj
 PX0UXhJt+Uv0gH/JAq8bEN1+vRBvE04FWdVhbBu6Dt/kVULcy05I6ga5+siz6BHC
 N+/ryk2wYHnZGC7poaEF60cNl9AT/dtKrKv+hj3jq9VFcYfs/ElaXKb/7jw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_qf6tJVdWxD for <openbmc@lists.ozlabs.org>;
 Mon, 31 Aug 2020 20:54:19 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AA0BE5436C
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 20:54:19 +0300 (MSK)
Received: from [10.199.0.250] (10.199.0.250) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 31
 Aug 2020 20:54:19 +0300
CC: <openbmc@lists.ozlabs.org>
From: i.kononenko <i.kononenko@yadro.com>
Subject: Naming DBus paths of CPU objects
Message-ID: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
Date: Mon, 31 Aug 2020 20:54:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.250]
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

Hi,

I'm working on improving of the OpenBMC RedFISH API. In particular, the endpoint of the Processor.
To provide all the properties of the applied RedFISH schema, we need to get from 
DBus everything related to the CPU object.
It can be CPU, Sensor CPU temp, Sensors Core CPU, etc.

However, some services have different names for the same physical processor. 
In particular it is about `entity-manager`, `dbus-sensros`, `smbios-mdr_v2`.
`Smbios-mdr_v2` (just like `hwmon`) names the processor, indexing 
it from 0; in `entity-manager` and `dbus-sensor` indexing starts from 1.

I want to add dbus-associations between all Processor's object, 
but for that I think we need to adopt a naming convention for the same DBus objects.

I like to index it from 0, just like doing that the `hwmon`, for example.

-- 
Best Regards!
Igor Kononenko
