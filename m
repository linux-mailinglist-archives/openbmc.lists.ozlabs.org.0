Return-Path: <openbmc+bounces-1152-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E1D10491
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 02:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqFkS0Y4fz2yqT;
	Mon, 12 Jan 2026 12:52:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768182752;
	cv=none; b=Tn78+5ir5CUU00DCDhgxK2Kq5YyOnhFUCt0omEVO9sMIEU5+uOjJVFa416jJzP1MMeSsDJTAYLotE3QHGAVZdRk6WJ37iSJNqOVxf0a2GQq/qi4Yj1+QyrLpoHKR0N+iGsf9XpvFdyEIRcP21N16oFG0p4c+h3tpBqIx94hs8/UeQ0OrnADxL/8cMlvnwqm6fcKGAh0w+HGJ1P9SDxXNyOp6bgkbzWFgTfnOa13lm6DkrIUe9wYCZm2IJSlR6HgIirs/8Hj/N3VNUuMZgkMpSDtcQ0+++JDpwJdfTbIcHJiMiPZY/J+C2d3+b6oKeWyMJIC+vF7LUYnfycxt8t3Duw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768182752; c=relaxed/relaxed;
	bh=x5tGceV2vxzlOBINrZoRI/3MedjjN+VlIx32uTMqyEw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVViKUXxFXas0e+tNKUUA1mVUEbolYPVRuGEIdbnio7uY+M+jV54fKyfDOmtcTIzYUatOn+Py6qpxd1v61Xcb7vHqIW8klZW0oNPZPqNohvw47inFa5fPAcCjJ1njbo+VRWoAvFhrusavLW4It/TNNzcMuPjsRdjoNFofYhNR/aSMzy77PiR6nhef1Mx4Trr9gvZcEaFKQZEaW2INxsyBERyQDWnXhkGyS2q/0SfhW241Wn8KKB47dGnxZO1J/2dnDDDU3vta2xvsWB15A6pIem8pKkTmnwp6Fb7adJPSuW3QjWaMb2xdXpCbInyngg/Bjkk+r8ZQZlovzp9ktUdCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BIUhlw16; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BIUhlw16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqFkR3Wxgz2ypw
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 12:52:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768182750;
	bh=x5tGceV2vxzlOBINrZoRI/3MedjjN+VlIx32uTMqyEw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=BIUhlw168r8tG3TBUB2k/yUFD6u4ubtnO3iVi6G0HafztVjoA/vjw9HVyt5lJXGt0
	 H9xwIkmoXNO1jbg5mAf3TibxoPe2jLxPkOwBYmF0+eWwTJ0NOLfoOUcSteIAwex5z4
	 Ee896nKnjPUpc0cOiW/gvu3+RL60/ccx5osgCRErSMaDpwumuW5ZAUcSTx3gQzsOBN
	 dUvSsA7KP+Yk7MSIJN9ZcbaRK+WffbHYIt3+4hoETiuOoByz6mf9iVzEgiyfgg6jVS
	 KglFkq7H/zLkqVK269k9NjNGM1lhstSAZCkQnQIzmNzz59bCpMU3XtRKkkANnARVOh
	 0qcjcsGUzjz2w==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF6C8648B5;
	Mon, 12 Jan 2026 09:52:30 +0800 (AWST)
Message-ID: <150ed77b60b22670766fcc1607fe696c0708acce.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.12 v2 0/6] Add device tree for Axiado AX3000
 EVK
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kuan-Jui Chiu <kchiu@axiado.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Date: Mon, 12 Jan 2026 12:22:30 +1030
In-Reply-To: <20260109060254.1575868-1-kchiu@axiado.com>
References: <20260109060254.1575868-1-kchiu@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2026-01-08 at 22:02 -0800, Kuan-Jui Chiu wrote:
> This pacth series adds device tree for Axiado AX3000 Evaluation Kit
> This device tree includes necessary device nodes for CPU, Clock,
> Interrupt, GPIO, I3C, UART and Timer
> The patch adds AX3000 into Cadence variant for device tree binding
>=20
> Changes since v1:
> =C2=A0- Add cover letter for patch series
> =C2=A0- Add upstream commit info in patches

Did you check whether the need for these patches is satisfied by
OpenBMC's (recent) move to the 6.18 kernel?

I don't tend to maintain inactive branches (in the sense that the
openbmc/openbmc linux recipes no-longer point to them). If maintaining
them is something you're interested in then we can discuss how you can
contribute to that.

Andrew

