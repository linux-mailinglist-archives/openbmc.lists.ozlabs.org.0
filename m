Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 308A8143819
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 09:18:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4821cw1PdmzDqVn
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 19:18:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=77.238.179.82;
 helo=sonic309-24.consmr.mail.ir2.yahoo.com;
 envelope-from=max_power2005-openbmc@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=SUnY3umu; dkim-atps=neutral
Received: from sonic309-24.consmr.mail.ir2.yahoo.com
 (sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4821c92VVQzDqLx
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 19:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579594642; bh=zscosl6/ydXjjjU5kGF++s6KBwmphSRI3lqXhUzsJuU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=SUnY3umuf4/4x9klwZVkex0JkXS+281DUtbEc58oVVI4M9uAVhz/3I6cdgAzFmG8BbI/yGjJvUYBn2zUFp8vMrdOVWVCHhdPqnB/+YSqCyZUjaV2QbNXIWy3Urf7uvbBVn+U0oPlDR9O04ZPeKSMtdqTPUSqVbwD3mFzM9b9zP/q2DvCBoKyplzHapwGEpnxjtVdn9Oc7qeAiv8uM6iGZ1y6kd7DL6aHNr4WmG3BcDNAbY01RmpE9lqxccZeJ1UMM6aec8HgSyIJl2+fpXyDgW6tN/23mAQEPPL6zXWz2mf6LhLwyXYg8xG00wF0X4Y4qdtxZgid/zbnLHiDUX18Eg==
X-YMail-OSG: Oh0J.N0VM1mqTem.By0rTqvtRSX_E7gXyD1q4Br2ejvTO9Zrl179JqlYf0l.gUY
 V3s_WKOmz5VigXxwLM4HhAvzaRaHWbcFYIGaG5wW1c7gztkU9k_vD0Cpv7zVq1RVTHYuTDDQqD2L
 32CP9o5LKijwKCxgySzvP8O_JHrroOjL2VIUZUA_NobBgaOqry1W37B3TQe6bcDWIUTXzLcBeGQb
 9HzeQ6v45YZ1c6GUiyYfR59phLCimJFPvETgTrH.oUwhNoZMnbmuU1lRkNXROZvDe1vnUbJXv6jC
 6_cXXKddUdsR.14L8tSGtSSytCUO9aPKhgV8XBYABhkaFD3jrhvcmhPBZb286Zx8H8HYJmtEvdlA
 S5JLCso4ZvlqwF7vzCMULzzuUKYO3X4FWt4UQ_bO_BLDZJS2kUtg6SSqPqtOI.A9ZLp6HrbjMYSx
 zJSV3PD7oBxX7ugSBAyE0Lf8cYX8xijcFhF.9F6VIiBcowUQ1TLGvWoNon.5SGBlkDGaiTh5fUqR
 KYFZC5bkhfcVJrlBXqtPto3z3uH8H0hC9UZ_KFKS7vCOsGtG7AkPCKnK5NHu6iAN.PSkJl3s3qTg
 g49be9z_0QEu2HGEmBTqwaLcij0FU4cYmcuw1csSCciUkDC6n682OwtK8GyNyIgTIMiOdrpZb8NP
 ea1f3ePD1zCQCVpDgOp0vz4dv0quXaLO2ZA8dnL0f_R41MAt2zYIDX1yI1uTB7jH6dxXyQZ0MN8.
 eH93FgkUiK.HXj4nVaBREWTt04337w5.D8QYA2DMb2BXnfevlRSgkv3wdYIkD7tkvQATTjGJ_2wk
 v6fNL_.SUrQtjx0f5iXn3ltvd7I3Gm3WAW9xk9phKCTY7CCpJVOMmUL3.8rWB5OQFtOsxXpm1nAy
 IUCGBB2G8vMP2DZHTswjA5v88NweKasPmCuoMTzlNj_b0828lLE760.11krYuwnlxHfbBDfl_Yon
 V6_UQaUN5eGaNgY6TkvZP.EeUpPuDTAZsdjBtlLkqWyzmEAszBzFnZnFzWFYzLzKofn02PdBwmtR
 tsvwGKZk.gdX7H3_1SGW2duXI0eBSDWHCTmoWH9q.8d7QkNd3.wzb.kJvZ5746E5dCzSFQJAc5hh
 8XH7oGqHxW.JgZPqxqY_SP9eW4QxOs5zceBd0NPCzXhVyAhptJb5ZfEx5A50Hl8xdUHH_OW1_vJA
 1d.DEul.LZVP2ltW6Ql68MnywhfTjlvTQl03HeW3V7JwXiZo09BfOiNdYBeDtIl9L5ch6bAIv.2Y
 HBPvtgMMRCmhLp7UhY3GCzcfxEzXmtElj96UTliFdOoS4tA.AISEZNeF_3.e9TCyUlSukHutifDi
 i9RsnEgI-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Tue, 21 Jan 2020 08:17:22 +0000
Date: Tue, 21 Jan 2020 08:17:18 +0000 (UTC)
From: Max Power <max_power2005-openbmc@yahoo.com>
To: openbmc@lists.ozlabs.org
Message-ID: <454935377.24643249.1579594638683@mail.yahoo.com>
In-Reply-To: <138261238.19427827.1579077694127@mail.yahoo.com>
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
Subject: Re: No sensors displayed in webUI
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_24643248_936677462.1579594638682"
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (X11; Linux i686;
 rv:52.0) Gecko/20100101 Firefox/52.0 SeaMonkey/2.49.5 Lightning/5.4
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
Cc: James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_24643248_936677462.1579594638682
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 Thank you all for your explanations.

Any chance to get the "bug in dbus-sensors" fixed in the near future?

Max
  
------=_Part_24643248_936677462.1579594638682
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<div>                Thank you all for your explanations.<br><br>Any chance to get the &quot;bug in dbus-sensors&quot; fixed in the near future?<br><br>Max<br>            </div>            
------=_Part_24643248_936677462.1579594638682--
