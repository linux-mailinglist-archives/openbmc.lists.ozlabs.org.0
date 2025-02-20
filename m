Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D268FA3E7FC
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 00:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzTJR61cDz3cTs
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 10:00:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740057025;
	cv=none; b=o3FXZl1ZVg3Z3ArVM1ooiMiKPEUQPqQSAJFzOCBT9sBkeIYtDiHY8muGg0BWAmcywahefuRxCEaMNGw90/R18KV6s2lEAUR7cQNykp3lMr3Ev+ZaVTz3M/sAA8h6UULgG6XZih9Jf4QC2cCcVIfQmmXXxhTUOcAi0mV0mGsuxWQmMAqnJ7mm0nIiTve3pHgRSb8iPPc+C6I2M4/hV7PYGnO6zufw05/SzoczAFIVVOpAvEGzMmacfy/mjn3FtY0Y5hFxunkH7fXEEND97hSqM06GNnE4Tbs/Yx2QAIEovKivVLoAN4rUbttDnKwxJFEKYYRxpu3MEp2L6rVUpWyA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740057025; c=relaxed/relaxed;
	bh=OBrsLbe0HjWHCcrKDPeKya7+7XKKh92mbuJq2Vmq+RI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=di2YyXKjqTHvEqgFlEaVVI1AxJbLm4nd+OFADIb7pbfqb+w72BndzBAU/8wXQTSqQJ10uCRjxIVf2rbtJklv4mTENY/ZyD3jZLWTXDATWsiK9b3yc5sENCZS306P8IIerGjatDwA1JIMusJJiEnXrOa/V6yGi1Ug1VD2FnOltBjZ1K7smEy+yE7e1GYN2JlV20ifPv1fbyvbZadF7MemeERmAQTmQINQWAOVsYBaO/RI0hZeTVvCEfyixvZrcOuZTn/+06m4Ieo5H7CuEVxrsRBUU1OIgs5CsyNDRO4wlepVA1RShgvikfkjURlTdBv/y+zDyOaXWIbfgZXpL3r1Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZRY9pjzZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=jishnunambiarcm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZRY9pjzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=jishnunambiarcm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzDC42lZ4z2ygY
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 00:10:23 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f40b8358dcso508077b6e.3
        for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2025 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740057020; x=1740661820; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OBrsLbe0HjWHCcrKDPeKya7+7XKKh92mbuJq2Vmq+RI=;
        b=ZRY9pjzZS1+uj81bh37bmH5BpX10g+GCerBfgeDAqH3Sp16i52R5rzLJtigqSYIC7g
         3d3iE3dxBFRMd1H3CtZbmgftFSGIvCJCycEFdJN8506hWQjnG2Ytjg9c1LXnYbMlhnmV
         v+kvzRY/cEd7IlVMBYZ8nZC4CgC+Xp4CcgGjyJWTCjFrCXlPDF0eFjqt2cg5rq2h0TvN
         JdcqtMQWbsDut1u9H7081jKrYpKvqG+nwWD53sGKQ+LyPuSnYwdi/fUBbZfpS0Z9+04h
         1so9w1eLNY6pJn3GkPUNsRKAQKMCKW59T20dVVK8qf6nEfZFoOvOgeHaP84GSqmPsQmG
         7GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057020; x=1740661820;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBrsLbe0HjWHCcrKDPeKya7+7XKKh92mbuJq2Vmq+RI=;
        b=uPMHz1uF5Iqn7geKzH3BGnyqfAC9WDfkcnQztC5PXW6k2RnbG7mxFoNUymU3Io+qSx
         do8kUH9pf/yhgDibkywv1iQ/zl41fWFKIRYnMQ7jhmW1IlxABxQ0sVPw+0EKcPnDaMIH
         95fDqO62p5pX7Qj2N+tWyt+hEvcrVXCdF6Qc03+I/o0/nOSMh8AAYvrvOmxBwgUBGZXJ
         BSqQ9sUok2w5ZCFZGQHE3AlYcljXwC6p4qyhjgBiO/AEmIWgFTfPn7AV6+uzpNz2gLWH
         wrF2rmnRVaU/PR2FB58tQdiLwxRL1zMsef5sK5N7qjlx1jfMNt7rCDYx8ZEA9mYT3l45
         HpDw==
X-Gm-Message-State: AOJu0YwlYiomX77lFeIhMSdeckXxTBp8Btg5dYbL9UCSjbDHKOAvh0c+
	vMWea1W+3xS3sI0cGrwXugs4BK/zMbyK9GoPtDfCEyb6w9tdfa/9mcLN4AWTCB2JsTHRxwwVu5Z
	5WahC98ntYh/g2a+//NsGDeGVekx7FYMO
X-Gm-Gg: ASbGnctdsOle9/NHkZH2uiV0UiCEEd5JpjCZ5EAVhuAzIyEx+eLQuWXyc4/Z7N9Secj
	H6GOMCqnAwSnY+B0eWiyCElGm0QhstI2rmfunfrWKY9LSFexaXlOrC1v3JiQLqCTws3G6VBwAvM
	QbYN+kX8afl87uZG0js76RSKSdgOzb
X-Google-Smtp-Source: AGHT+IFSsWNfzflKLcWR+g81ccafwCxN7y7LeIbH2gyL838po6/bNOa5A9h7wkSJ6lqoiQqyL4gwDctUi89G2iNa6H8=
X-Received: by 2002:a05:6808:4495:b0:3f4:1ce1:69b5 with SMTP id
 5614622812f47-3f41ce16a8emr1594855b6e.29.1740057020533; Thu, 20 Feb 2025
 05:10:20 -0800 (PST)
MIME-Version: 1.0
From: Jishnu Nambiar <jishnunambiarcm@gmail.com>
Date: Thu, 20 Feb 2025 18:40:09 +0530
X-Gm-Features: AWEUYZmqYKXX3NJ5Wi6b4TKqjYPW8jT_R-C5Vjt44RHiI5YnNYNZ47MK1WUb9ko
Message-ID: <CAG=JMOXU-Z1zfCSHepgFLSNogoGcgKjrpoEaESkP4_PEOBzscQ@mail.gmail.com>
Subject: Proposal: Adopting FIPS 204 (ML-DSA) Post-Quantum Encryption
 Standards in BMC Tar Image
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000991488062e92980d"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 21 Feb 2025 10:00:52 +1100
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

--000000000000991488062e92980d
Content-Type: text/plain; charset="UTF-8"

Hello Community,

I'm proposing an update to the BMC tar image to adopt the FIPS 204 (ML-DSA)
Post-Quantum Encryption Standards, finalized by NIST
<https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-finalized-post-quantum-encryption-standards>
in August 2024. This update will enhance the security and integrity of the
image by incorporating a post-quantum resistant signing method using
ML-DSA, in addition to the existing RSA signing method. The proposed design
includes the following aspects:

   - Generating a new set of private and public key pairs for ML-DSA
   - Updating the directory structure to include MLDSA signature files,
   with a proposed structure as follows:
      - image-rofs.sig
      - image-kernel.sig
      - MANIFEST.sig
      - publickey
      - MLDSA/
         - public_key_MLDSA
         - image-bmc_MLDSA.sig
         - image-hostfw_MLDSA.sig
         - image-kernel_MLDSA.sig
         - image-rofs_MLDSA.sig
         - image-rwfs_MLDSA.sig
         - image-u-boot_MLDSA.sig
         - MANIFEST_MLDSA.sig
      - Modifying the image generation process to support the new signing
   method, including updates to generate and include MLDSA signature files in
   the tar archive
   - Updating the manifest to include MLDSA-related information
   - Ensuring backward compatibility with existing RSA signing methods to
   allow for a smooth transition to the new ML-DSA signing method. The code
   update will perform ML-DSA verification only if a valid ML-DSA key is found
   on the BMC flash; otherwise, it will skip this check and only perform RSA
   verification. Additionally, if an ML-DSA key is present on the BMC flash,
   an ML-DSA signature is expected to be present in the incoming image; if
   not, the image will be rejected to prevent reverting to RSA-only
   verification by removing ML-DSA signatures from newer images.
   - Modifying the signature verification process to support both RSA and
   ML-DSA signature validation.

Please share any feedback or suggestions you may have.

Thanks & Regards,
Jishnu.

--000000000000991488062e92980d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"color:rgb(0,0,0)">Hello Community,=C2=A0</p><p=
 style=3D"color:rgb(0,0,0)">I&#39;m proposing an update to the BMC tar imag=
e to adopt the FIPS 204 (ML-DSA) Post-Quantum Encryption Standards, <a href=
=3D"https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-fin=
alized-post-quantum-encryption-standards">finalized by NIST</a> in August 2=
024. This update will enhance the security and integrity of the image by in=
corporating a post-quantum resistant signing method using ML-DSA, in additi=
on to the existing RSA signing method. The proposed design includes the fol=
lowing aspects:</p><ul style=3D"color:rgb(0,0,0)"><li>Generating a new set =
of private and public key pairs for ML-DSA</li><li>Updating the directory s=
tructure to include MLDSA signature files, with a proposed structure as fol=
lows:=C2=A0</li><ul><li>image-rofs.sig=C2=A0</li><li>image-kernel.sig</li><=
li>MANIFEST.sig=C2=A0</li><li>publickey=C2=A0</li><li>MLDSA/=C2=A0</li><ul>=
<li>public_key_MLDSA=C2=A0</li><li>image-bmc_MLDSA.sig</li><li>image-hostfw=
_MLDSA.sig</li><li>image-kernel_MLDSA.sig</li><li>image-rofs_MLDSA.sig</li>=
<li>image-rwfs_MLDSA.sig</li><li>image-u-boot_MLDSA.sig</li><li>MANIFEST_ML=
DSA.sig</li></ul></ul><li>Modifying the image generation process to support=
 the new signing method, including updates to generate and include MLDSA si=
gnature files in the tar archive</li><li>Updating the manifest to include M=
LDSA-related information</li><li>Ensuring backward compatibility with exist=
ing RSA signing methods to allow for a smooth transition to the new ML-DSA =
signing method. The code update will perform ML-DSA verification only if a =
valid ML-DSA key is found on the BMC flash; otherwise, it will skip this ch=
eck and only perform RSA verification. Additionally, if an ML-DSA key is pr=
esent on the BMC flash, an ML-DSA signature is expected to be present in th=
e incoming image; if not, the image will be rejected to prevent reverting t=
o RSA-only verification by removing ML-DSA signatures from newer images.</l=
i><li>Modifying the signature verification process to support both RSA and =
ML-DSA signature validation.</li></ul><div><span style=3D"color:rgb(0,0,0)"=
><font face=3D"arial, sans-serif">Please share any feedback or suggestions =
you may have.</font></span><font color=3D"#000000"><span style=3D"caret-col=
or: rgb(0, 0, 0);"><br></span></font></div><div><span style=3D"color:rgb(0,=
0,0)"><font face=3D"arial, sans-serif"><br></font></span></div><div><span s=
tyle=3D"color:rgb(0,0,0)"><font face=3D"arial, sans-serif">Thanks &amp; Reg=
ards,</font></span></div><div><span style=3D"color:rgb(0,0,0)"><font face=
=3D"arial, sans-serif">Jishnu.</font></span></div><div><span style=3D"color=
:rgb(0,0,0)"><font face=3D"arial, sans-serif"><br></font></span></div><div>=
<font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);"><br></sp=
an></font></div></div>

--000000000000991488062e92980d--
