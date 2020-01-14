Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC313A79E
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 11:42:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xn8N5Sy5zDqQ6
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 21:42:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=z0WBA69u; 
 dkim-atps=neutral
X-Greylist: delayed 60 seconds by postgrey-1.36 at bilbo;
 Tue, 14 Jan 2020 21:41:27 AEDT
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xn7W3CHrzDqPg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 21:41:27 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id DBD6E2E14F8
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 13:39:55 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CNcymC7h8n-dtL8b9NS; Tue, 14 Jan 2020 13:39:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1578998395; bh=/nhhKPrBrUIoFIRXGHTV0zzT0i5vyPkrh0PNbOcT5mc=;
 h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
 b=z0WBA69uBo4hkogM/rQN/t75KBFhv+3Q4Nq1cC979Qg0jpVlks/gphVNcLMyk+JsU
 6Jl851coTT0pHIYHZw9D6uIp4eTaVNxClI4Jaz5QIc3PhjCLOE4vHSEigD4zhvHaAx
 RyRM+CojxCDbIntopfQ5I9kl1oq05ogZ8lg3q/TU=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by vla5-c30c59847b9e.qloud-c.yandex.net with HTTP;
 Tue, 14 Jan 2020 13:39:55 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
Subject: Re: multiple device trees
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 Jan 2020 13:39:55 +0300
Message-Id: <1298611578998395@vla5-c30c59847b9e.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/html; charset=utf-8
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

<div> </div><div>Hello, Brad!</div><div> </div><div>I'm doing this using overlay DTS.</div><div>I have a startup script that detects board type by GPIO pins and loads corresponding overlay.</div><div> </div><div>14.01.2020, 04:56, "Brad Bishop" &lt;bradleyb@fuzziesquirrel.com&gt;:</div><blockquote><p>Does anyone have any experience supporting multiple system configurations in a monolithic flash image with multiple device trees? Did you consider this and do something else instead?<br /><br />thanks!<br /><br />-brad</p></blockquote><div> </div><div> </div><div>-- </div><div>Best regards,</div><div>Konstantin Klubnichkin,</div><div>lead firmware engineer,</div><div>server hardware R&amp;D group,</div><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33</div><div> </div>
