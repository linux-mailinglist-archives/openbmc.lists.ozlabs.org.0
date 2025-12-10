Return-Path: <openbmc+bounces-1021-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF1CBC3A0
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3MB5hdJz2xS3;
	Mon, 15 Dec 2025 13:06:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=51.75.73.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765359110;
	cv=none; b=HgCZOIibqo+4Gbg/FasXd0y8zk1sa275MLhZrXQCq/KC2xuO4GiAStsJBs7fVbkkp5/bsVrtwyTXQtzkZL0U5oQSFQoPrL5HOfl/sMWjgQNHY8jFrtx+xKtwHlaz7L3qI+1cIWECGV/RFCcfkafPZkW8dPk48q/ahsoKK94DSk13Fpvfb/FbkAdZjZwfuxmo2X5wqt/DTMSRyFw/liorVKuiL0VY0tw8TjaRJPYksfUpNAMpzX46whWOnkDMjRdxy1sua3iM0MSJiV+wmv9nTUI17GH1dHsMQ3WB4Qfoz0lOwEwgn/NgI1o2RegiHLvnjd8i3cbpp4F4ZOm8J1XMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765359110; c=relaxed/relaxed;
	bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=KnvSBD80BGQpMepkvR8Bf7ES4zUdsdftR5oCYUDZKVs+FHi8WD5+gnQezMgQfgU4JkoYzBaq1nH7DAK4CVBmgVBcDS2RrtC4mH1n8H5JhEH6UnOX6aDBdJ62+GjfBp6DaNGKlc60YsfPfeCOm2oM0kTymqqyzpDz+qc6M/o58hwdq/heBaGjPQ4G5vSYLi+3xzAKoT+usX3UL+9onf18OMJY2HkoGq0s5YtGQrzWZD6EeQtEYWHptSfA6eAoRtocz6euwuu1iO1HgO5oFRpdqsx7vynH9vaiGwAcwHsbVuqveVbhzG8PdHelxO9sbPSQXk+/BhPkttz58GqI69Xugw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=growzi.pl; dkim=pass (2048-bit key; secure) header.d=growzi.pl header.i=@growzi.pl header.a=rsa-sha256 header.s=mail header.b=tTRIkol3; dkim-atps=neutral; spf=pass (client-ip=51.75.73.133; helo=mail.growzi.pl; envelope-from=eryk.wawrzyn@growzi.pl; receiver=lists.ozlabs.org) smtp.mailfrom=growzi.pl
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=growzi.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=growzi.pl header.i=@growzi.pl header.a=rsa-sha256 header.s=mail header.b=tTRIkol3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=growzi.pl (client-ip=51.75.73.133; helo=mail.growzi.pl; envelope-from=eryk.wawrzyn@growzi.pl; receiver=lists.ozlabs.org)
X-Greylist: delayed 1028 seconds by postgrey-1.37 at boromir; Wed, 10 Dec 2025 20:31:48 AEDT
Received: from mail.growzi.pl (mail.growzi.pl [51.75.73.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR9Tc5Q5Kz2yD4
	for <openbmc@lists.ozlabs.org>; Wed, 10 Dec 2025 20:31:48 +1100 (AEDT)
Received: by mail.growzi.pl (Postfix, from userid 1002)
	id E50BB27DF1; Wed, 10 Dec 2025 10:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growzi.pl; s=mail;
	t=1765357595; bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Date:From:To:Subject:From;
	b=tTRIkol3qDW6TPU+rKPcIF5jL/kpNrKNlbBiF2cJNk4XlRLIWnjiluw9/zS4QIgHA
	 FUgRPbhv/AAUwzhjhiaJCwPdJPdGcL3NlEcJt2XRul03UfL6lo5/lQ/E1A0vvbLVfs
	 J9Lwv22H8GyYv29P7r6ipard3/Cn3aGwhWp8PL/tjTL6QK+qxTHNeWhZVXV8CUKLpr
	 stTdHgkjFvN41/zCK2MNy4H3z02SuTkumsrsQLGV0lrjxf0HV+2Zlim/prRuHVmJOL
	 b+bYDcCWKbI3Qh05WYgbR3YdAcFJkZmaPsXPZUTDx0oLqiiszZwqQ/hNcZDSklLKXw
	 kyV9n0aPRk3Dw==
Received: by mail.growzi.pl for <openbmc@lists.ozlabs.org>; Wed, 10 Dec 2025 09:06:06 GMT
Message-ID: <20251210084501-0.1.ex.18po3.0.ca2prl8n6o@growzi.pl>
Date: Wed, 10 Dec 2025 09:06:06 GMT
From: "Eryk Wawrzyn" <eryk.wawrzyn@growzi.pl>
To: <openbmc@lists.ozlabs.org>
Subject: Zwrot
X-Mailer: mail.growzi.pl
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dzie=C5=84 dobry,

kontaktuj=C4=99 si=C4=99 w imieniu kancelarii specjalizuj=C4=85cej si=C4=99=
 w zarz=C4=85dzaniu wierzytelno=C5=9Bciami.

Od lat wspieramy firmy w odzyskiwaniu nale=C5=BCno=C5=9Bci. Prowadzimy ko=
mpleksow=C4=85 obs=C5=82ug=C4=99 na etapach: przeds=C4=85dowym, s=C4=85do=
wym i egzekucyjnym, dostosowuj=C4=85c dzia=C5=82ania do bran=C5=BCy Klien=
ta.

Kiedy mo=C5=BCemy porozmawia=C4=87?


Pozdrawiam
Eryk Wawrzyn

