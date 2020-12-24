Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2D2E27F7
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 16:48:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1vcC4CNbzDqNf
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 02:48:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=n3bTA6mZ; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1vbV3J0qzDqMp
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 02:47:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 325E341396;
 Thu, 24 Dec 2020 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1608824845;
 x=1610639246; bh=dzC+XT7Oe3yC61v5f6HLzYzwyGc2o+rAOuY7gW8JOms=; b=
 n3bTA6mZYoAeJWUMp1ReBEqJbT+GH+wQmCmZdkUr64/3OU6Irwi+EP8XZaYQNQEr
 VK/9AiGTC26CXNs+vuEy/DFnod/ehQzQ+hpc9k/Yhx6SBkCO6AFy5I/MwwFrVFHm
 vjRjRCT4c2WAGFXJu4D1eVnahph6o32yqFn4bSGn1+A=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uZRIC0kRWua; Thu, 24 Dec 2020 18:47:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 168AF412FD;
 Thu, 24 Dec 2020 18:47:25 +0300 (MSK)
Received: from [10.199.0.21] (10.199.0.21) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Dec 2020 18:47:24 +0300
Message-ID: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
Subject: peci-pcie CI issues
From: Andrei Kartashev <a.kartashev@yadro.com>
To: jason.m.bills <jason.m.bills@linux.intel.com>
Date: Thu, 24 Dec 2020 18:47:23 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.21]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hello Jason,

I push several patches to peci-pcie repo, but looks like CI broken
there. Could you take a look on how to fix CI?

[ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o
In file included from /usr/local/include/boost/asio/execution.hpp:19,
                 from /usr/local/include/boost/asio/system_executor.hpp:20,
                 from /usr/local/include/boost/asio/associated_executor.hpp:22,
                 from /usr/local/include/boost/asio/detail/bind_handler.hpp:20,
                 from /usr/local/include/boost/asio/detail/wrapped_handler.hpp:18,
                 from /usr/local/include/boost/asio/io_context.hpp:23,
                 from /usr/local/include/boost/asio/io_service.hpp:18,
                 from /home/jenkins-op/workspace/ci-repository/openbmc/peci-pcie/src/peci_pcie.cpp:22:
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member function âstatic const std::type_info& boost::asio::execution::detail::any_executor_base::target_type_void()â:
/usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: cannot use âtypeidâ with â-fno-rttiâ
  811 |     return typeid(void);
      |                       ^
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member function âstatic const std::type_info& boost::asio::execution::detail::any_executor_base::target_type_ex()â:
/usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: cannot use âtypeidâ with â-fno-rttiâ
  851 |     return typeid(Ex);
      |                     ^

-- 
Best regards,
Andrei Kartashev


