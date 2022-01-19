Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B9F49352A
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 07:49:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdx855TVMz30gg
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 17:49:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=BwAbs/qh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=BwAbs/qh; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdx7D1Cm3z3bTd
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 17:48:39 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 18D48135;
 Tue, 18 Jan 2022 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1642574916;
 bh=cXqNS9oxeWnPCgtLPMam07e5ji5JmEjZaiMzj3q0aGg=;
 h=From:To:Cc:Subject:Date:From;
 b=BwAbs/qhbbnUrn+Prpl/a+GLc1AY57gDguxIpIDlLbvE9Cij5gURBJRc8HqeIJT+b
 mId3daWW/wG/ord2/UzGIKqcjuVl2Gn8IAsRrhBeowQzAfAmc1ZyByFXCAfXnT5oNu
 h8t8tAUY2HeftNz3Ac7HEBGn4rSQTMUSxv3K5rWc=
From: Zev Weiss <zev@bewilderbeest.net>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] u-boot: Split do_configure logic into separate file
Date: Tue, 18 Jan 2022 22:48:12 -0800
Message-Id: <20220119064812.17824-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some auxiliary u-boot recipes may need u-boot properly configured
(including *.cfg additions via bbappends) but aren't necessarily
building u-boot itself; to support such situations, here we split the
u-boot do_configure() out of u-boot.inc and into its own
u-boot-configure.inc.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 meta/recipes-bsp/u-boot/u-boot-configure.inc | 39 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc           | 31 +---------------
 2 files changed, 40 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-configure.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
new file mode 100644
index 000000000000..04e0894752f4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -0,0 +1,39 @@
+# This provides the logic for creating the desired u-boot config,
+# accounting for any *.cfg files added to SRC_URI.  It's separated
+# from u-boot.inc for use by recipes that need u-boot properly
+# configured but aren't doing a full build of u-boot itself (such as
+# its companion tools).
+
+inherit uboot-config cml1
+
+DEPENDS += "kern-tools-native"
+
+do_configure () {
+    if [ -n "${UBOOT_CONFIG}" ]; then
+        unset i j
+        for config in ${UBOOT_MACHINE}; do
+            i=$(expr $i + 1);
+            for type in ${UBOOT_CONFIG}; do
+                j=$(expr $j + 1);
+                if [ $j -eq $i ]; then
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
+                        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
+                        oe_runmake -C ${S} O=${B}/${config} oldconfig
+                    fi
+                fi
+            done
+            unset j
+        done
+        unset i
+        DEVTOOL_DISABLE_MENUCONFIG=true
+    else
+        if [ -n "${UBOOT_MACHINE}" ]; then
+            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+        else
+            oe_runmake -C ${S} O=${B} oldconfig
+        fi
+        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+        cml1_do_configure
+    fi
+}
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 2d5e46f4ef1c..f022aed732ce 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,7 +3,6 @@ PROVIDES = "virtual/bootloader"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS += "kern-tools-native"
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
 inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
@@ -25,35 +24,7 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?= ""
 
-do_configure () {
-    if [ -n "${UBOOT_CONFIG}" ]; then
-        unset i j
-        for config in ${UBOOT_MACHINE}; do
-            i=$(expr $i + 1);
-            for type in ${UBOOT_CONFIG}; do
-                j=$(expr $j + 1);
-                if [ $j -eq $i ]; then
-                    oe_runmake -C ${S} O=${B}/${config} ${config}
-                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
-                        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
-                        oe_runmake -C ${S} O=${B}/${config} oldconfig
-                    fi
-                fi
-            done
-            unset j
-        done
-        unset i
-        DEVTOOL_DISABLE_MENUCONFIG=true
-    else
-        if [ -n "${UBOOT_MACHINE}" ]; then
-            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
-        else
-            oe_runmake -C ${S} O=${B} oldconfig
-        fi
-        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
-        cml1_do_configure
-    fi
-}
+require u-boot-configure.inc
 
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-- 
2.33.0

