Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16F1977B5
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 11:20:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rRlX2cVwzDqfv
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 20:20:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=gUGs50PE; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rRkg5jT0zDqcw
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 20:20:11 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C646D412DB
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1585560006;
 x=1587374407; bh=LMB3ryQ3vtT3d1556YHQI6SSZkXDijNBw5DYl9gX+kA=; b=
 gUGs50PEQFFnIMrlJ0dnZs0MLnMBmj047LSfKOb9pv72YY6Sro7PgVGwY2XT0JT5
 V/RGAoK7IwUazzcWCx99ZDLJDv9f8MNKMNqhMfhnzjOOtq33yQj3NQSt1vtPIVKm
 JZ7MnGsiWKfYT8xLpPkXmgHJDILCp+yMF5injGOnNWc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3A_ob5nqzmTV for <openbmc@lists.ozlabs.org>;
 Mon, 30 Mar 2020 12:20:06 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7706C4120D
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:20:06 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Mar 2020 12:20:07 +0300
Date: Mon, 30 Mar 2020 12:20:06 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Any idea of when Virtual Media will be supported in the Web UI
 for https://github.com/Intel-BMC/openbmc ?
Message-ID: <20200330092006.GA21978@bbwork.lan>
References: <76bad904573040cc874ee52de5bf3981@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <76bad904573040cc874ee52de5bf3981@SCL-EXCHMB-13.phoenix.com>
X-Originating-IP: [172.17.14.122]
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

On Fri, Mar 27, 2020 at 05:05:07PM +0000, Bruce Mitchell wrote:
> Any idea of when Virtual Media will be supported in the Web UI for https://github.com/Intel-BMC/openbmc ?
> 
> 

The Virtual Media works fine for our wolfpass-based hardware.
I have switched our yocto layer to use original openbmc/phosphor-webui and
enabled the REST support in the bmcweb.

Alexander
