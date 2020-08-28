Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B832552F1
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 04:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd3Bg55N1zDqmf
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 12:16:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=59.36.132.97; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=GzCyxVRM; dkim-atps=neutral
X-Greylist: delayed 84 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 12:14:45 AEST
Received: from qq.com (smtpbg480.qq.com [59.36.132.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd3852QlMzDqdZ
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 12:14:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1598580775; bh=ourAk6914/rExH3Dr8LXOjMwXdlsR/ORSRNYuiHDHxs=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=GzCyxVRMwTFvFQbLo4DsSQn795uzUs773s+mKddHJHNwCf1+xT7+uOVN3PZjekYzW
 G+ePkaYVZsRs4jBlIXFkc6nw+JZdseB5TTEeeopV2dfiQuhYr0bqfjrfLVEeJAoO5X
 d9CUCpLYXSHjJArCCj9BhyIUyZkhi7XSeqjz/Adw=
X-QQ-FEAT: Ui0iwQiQQaDNo7ESxfsdzVuDywxfS8vfzZKSP0f4b70NBEsao0ZeXEDCm+AnB
 mG56grqWF82B4afekLs3TpYaChp563NnXY8QFJTPpNczT8Ix6i7IODrxVJtYTLFLLsaKP6J
 fZtm+G6jGf9Rgz9zO2T30owZAeK4CTkrtBc/dqVx+R1tDT6RyXLMqzL4PlnLXKth1WIsJAO
 u+OvFb3jNnl8wACnvf5gY+6Woy7MN1+TGhIy9i4wgpm81fmPTr71Ra1cmXqrN5BPqPwoN4W
 0UueZqV25llOTd
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: Ne9tFK0A+QeOAwQEuOPzjMprVXWHKrFgc9wsVhJatnqeVUMLGYAfOb+EQ4llYc
 BUR0aMH1vX5H4maccBftcLIWdA6f98Dc79pF/B+SRYmV/3kcyDUZhuJbxouMbpR1fc5xBNfMkWhKt
 mmozLX/z+5z2SH1TWoNNKu1Gg/E1g3xTcw3jMzgpogg2QFW41kEoeg858vttVKnoQs8V6w2I9i/m7
 YIzAnQKqFf9J3zGtU6rpkkJIDiEpyjMiOzUzhk8CgLKCNLFpcWdH8BAzIpEGFbtTl9gnmr1l9e6ZX
 kXlzt1d7Wtz+0zeJ+uPUUAzm+BZCUYUCVLXqGTbUIOpXwcuP9digNrJpdhmU7tmfM9Mc014P3cMLh
 X8cIiGfyaxF6SPS99PddnruaMTUUVp9gvdg00tS4XvMwgx869PjRFSlwkt87BvFZ/niGfhzyLQJ7R
 4n5yQhTswjEJT9/wPDu+t1l3/U44jTrR63yvNxSvLNWz+PbRMW/aXipxahWgOawRb2nVvh97dUTLB
 Pq9ngmOY3UYY1aCYyy2Idp1lTMJeWDzDu01eteahDRtftxxT5KaY27RuYADs6X3qDYY42Y4Uil5Du
 NDcA0rWRM6bw/jYEPrjdDXLqpd0Ulamf6tMBX6DDYm0c85j98ltinLTqpT6vOzS2nPITD70batoj7
 1JsY4cuAPO+bwXaUc=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.18.137
X-QQ-STYLE: 
X-QQ-mid: webmail700t1598580773t9778912
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: XDMA engine for AST2400
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5F486825_0FE51D20_04A8E14D"
Content-Transfer-Encoding: 8Bit
Date: Fri, 28 Aug 2020 10:12:53 +0800
X-Priority: 3
Message-ID: <tencent_6FC98F43C847A4FA599681BF8ABCC554C006@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 28 Aug 2020 10:12:54 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
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

This is a multi-part message in MIME format.

------=_NextPart_5F486825_0FE51D20_04A8E14D
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzLA0KDQoNCkkgYW0gbGVhcm5pbmcgT3BlbmJtYyB3aXRoIGEgQVNUMjQwMCBC
TUMuIEkgYW0gbGVhcm5pbmcgWERNQSBlbmdpbmUuIEkgc2F3IHRoZXJlIGlzIGEgZHJpdmVy
IGluIHRoZSBsaW51eCBrZXJuZWwoL2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQteGRtYS5j
KSBmb3IgWERNQSBlbmdpbmUuIEJ1dCB0aGlzIGRyaXZlcidzICJvZl9tYXRjaF90YWJsZSIg
b25seSBzdXBwb3J0IEFTVDI1MDAgYW5kIEFTVDI2MDAuDQpEb2VzIEFTVDI0MDAgbm90IHN1
cHBvcnQgWERNQSBlbmdpbmU/IEJ1dCBpbiB0aGUgZGF0YXNoZWV0LCB0aGUgQVNUMjQwMCBo
YXMgYSBYRE1BIGVuZ2luZSBhcyB3aXRoIEFTVDI1MDAuDQpDYW4gc29tZSBvbmUgaGVscCBt
ZT8gVGhhbmtzIQ0KDQoNCkJlc3QgUmVnYXJkcyENCkxpdSBIb25nd2Vp

------=_NextPart_5F486825_0FE51D20_04A8E14D
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5HcmVldGluZ3MsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JIGFtIGxlYXJuaW5nIE9wZW5ibWMgd2l0aCBhIEFTVDI0MDAgQk1DLiBJIGFtIGxlYXJu
aW5nIFhETUEgZW5naW5lLiBJIHNhdyB0aGVyZSBpcyBhIGRyaXZlciBpbiB0aGUgbGludXgg
a2VybmVsKC9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXhkbWEuYykgZm9yIFhETUEgZW5n
aW5lLiBCdXQgdGhpcyBkcml2ZXIncyAib2ZfbWF0Y2hfdGFibGUiIG9ubHkgc3VwcG9ydCBB
U1QyNTAwIGFuZCBBU1QyNjAwLjwvZGl2PjxkaXY+RG9lcyBBU1QyNDAwIG5vdCBzdXBwb3J0
IFhETUEgZW5naW5lPyBCdXQgaW4gdGhlIGRhdGFzaGVldCwgdGhlIEFTVDI0MDAgaGFzIGEg
WERNQSBlbmdpbmUgYXMgd2l0aCBBU1QyNTAwLjwvZGl2PjxkaXY+Q2FuIHNvbWUgb25lIGhl
bHAgbWU/IFRoYW5rcyE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkcyE8
L2Rpdj48ZGl2PkxpdSBIb25nd2VpPC9kaXY+

------=_NextPart_5F486825_0FE51D20_04A8E14D--



