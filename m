Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B437B6E49
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0NPJ2rCVz3c7Q
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 03:21:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0NNx2c3wz2yVT;
	Wed,  4 Oct 2023 03:21:21 +1100 (AEDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0NKn0q8Wz67ydC;
	Wed,  4 Oct 2023 00:18:37 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 3 Oct
 2023 17:21:17 +0100
Date: Tue, 3 Oct 2023 17:21:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <20231003172116.0000736e@Huawei.com>
In-Reply-To: <1fd97872-446e-42f3-84ad-6e490d63e12d@app.fastmail.com>
References: <20230928123009.2913-1-aladyshev22@gmail.com>
	<20230928123009.2913-4-aladyshev22@gmail.com>
	<20230929120835.0000108e@Huawei.com>
	<1fd97872-446e-42f3-84ad-6e490d63e12d@app.fastmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>, Konstantin Aladyshev <aladyshev22@gmail.com>, Avi
 Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Jeremy Kerr <jk@codeconstruct.com.au>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>, Joel Stanley <joel@jms.id.au>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> Thanks for the drive-by comments!

No problem and keep up the good work in tidying this up.
Many dark and interesting corners in the kernel and not all of them get
the work they deserve :)

Feel free to CC me and I'll take a look at any cleanup you propose.
At least KCS is small so there aren't 100s of drivers to change :)

Jonathan

> 
> Andrew

